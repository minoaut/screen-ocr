import unittest

# load module with dash name and inject its globals
exec(open("screen-ocr").read())


class TestUpdateLanguagePresets(unittest.TestCase):
    def test_no_changes(self):
        old = ["eng", "fra"]
        new = ["eng", "fra"]
        presets = ["eng", "eng+fra"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["eng", "eng+fra"])

    def test_add_language_to_presets(self):
        old = ["eng"]
        new = ["eng", "fra"]
        presets = ["eng"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["eng", "fra"])

    def test_remove_language_invalidates_presets(self):
        old = ["eng", "fra", "swe"]
        new = ["eng", "fra"]
        presets = ["eng", "eng+swe", "fra"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["eng", "fra"])

    def test_add_language_not_in_any_preset(self):
        old = ["eng"]
        new = ["eng", "jpn"]
        presets = ["eng"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["eng", "jpn"])

    def test_remove_language_not_in_any_preset(self):
        old = ["eng", "fra"]
        new = ["eng"]
        presets = ["fra"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, [])

    def test_multiple_languages_delta(self):
        old = ["eng", "fra", "swe"]
        new = ["eng", "jpn"]
        presets = ["eng", "fra+swe"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["eng", "jpn"])

    def test_empty_presets(self):
        old = ["eng"]
        new = ["eng", "fra"]
        presets = []
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["fra"])

    def test_empty_old_new(self):
        result = update_language_presets([], ["eng"], [])
        self.assertEqual(result, ["eng"])

    def test_empty_new(self):
        result = update_language_presets(["eng"], [], [])
        self.assertEqual(result, [])

    def test_complex_presets_and_delta(self):
        old = ["eng", "fra", "swe"]
        new = ["eng", "jpn", "fra"]
        presets = ["eng", "fra", "fra+swe", "swe", "eng+swe"]
        result = update_language_presets(old, new, presets)
        self.assertEqual(result, ["eng", "fra", "jpn"])
