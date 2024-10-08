___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Text Replace",
  "description": "This variable allows you to replace one string with another and trim any spaces around this substring",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "var",
    "displayName": "Input variable",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "input",
    "displayName": "characters to replace",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "output",
    "displayName": "Characters to add",
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "trimSpaces",
    "checkboxText": "Trim spaces",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// GTM Custom JavaScript Template
const stringInput = data.var;   // Input string
const findInput = data.input;       // Substring to find
const replaceInput = data.output; // Substring to replace
const trimSpaces = data.trimSpaces;

// Function to replace all occurrences of a substring
function replaceAllOccurrences(str, find, replace, trim) {
  let result = str;
  let index;

  // Continue finding occurrences of the substring until none are left
  while ((index = result.indexOf(find)) !== -1) {
    // Only trim spaces if the option is enabled
    if (trim) {
      // Check for spaces before and after the found substring
      let start = index;
      let end = index + find.length;

      // Remove leading spaces (before the substring)
      while (start > 0 && result[start - 1] === ' ') {
        start--;
      }

      // Remove trailing spaces (after the substring)
      while (end < result.length && result[end] === ' ') {
        end++;
      }

      // Replace the entire section (including spaces) with the replacement
      result = result.slice(0, start) + replace + result.slice(end);
    } else {
      // If trim is not enabled, just replace the found substring
      result = result.slice(0, index) + replace + result.slice(index + find.length);
    }
  }

  return result;
}
// Call the function with the provided arguments
return replaceAllOccurrences(stringInput, findInput, replaceInput, trimSpaces);


___TESTS___

scenarios: []


___NOTES___

Created on 8-10-2024 15:44:01


