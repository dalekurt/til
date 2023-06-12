# Primitive Data Types
1. Numbers
	1. Integers (`3`, `82`, `38218`, `+3`, `-71`)
	2. Floats (`0.32`, `.32`, `83.7823`, `1.00`, `-5.45`)
2. Strings
3. Booleans
4. `None`

## Numbers

Fun fact! In Python, decimal numbers are stored using scientific notation. If you’ve forgotten what that means since you last took a math class, basically larger numbers like `3500.0` are stored as `3.5 x 10^3`. The position of the decimal place “_floats_” backward and forward as the exponent changes, hence the name.

### What Do We Do With Numbers?

In Python, programmers perform equations with data by using numerical operators, which include `+`, `-`, `*`, `/`, `//`, and `%`.

| Operator | What Does It Do? |
| -------------- | ------------ |
| `+` | Addition |
| `-` | Subtraction |
|`*` | Multiplication|
| `/`| Flost division|
| `//`| Integer division |
| `%`| The modulo is used to get the remainder of a division equation.|

### Booleans

Boolean variables have one of two possible values: `True` or `False`

| 1 | 0 |
| --- | --- |
| On | Off |
| True | False |
| Yes | No |

### Strings

**Strings** are collections of letters and symbols known as “characters.”

For example:

- `first_name = 'Charles'`
- `org_city = 'Singapore'`
- `brand_name = 'adidas'`

To indicate a string in Python code, simply enclose it with either ‘single’ or “double” quotation marks. If your string contains a single quote, like `diner_name = "Sandy's"`, then enclose it with double quotes, and vice versa.

#### Escape Characters

|Escape Character|Definition|Sample Code|Sample Output|
|---|---|---|---|
|`\n`|Creates a new line.|`'Line One\nLine Two'`|Line One  <br>Line Two|
|`\t`|Indents text.|`'\t- Bullet 1'`|Bullet 1|

There will be times when we want Python to print out a good old-fashioned backslash instead of reading it as an escape character. To do so, just write `\\`.

### None

The last of the primitive data types we’ll cover is `none`. This data type represents a null value, or the absence of data, and it is _not_ interchangeable with `0`.


## Data Types Summary

|Data Type|What It Is|Example|What Is It Used For?|
|---|---|---|---|
|**Integer**|A whole number, either positive or negative.|`+37`, `8`, `-100387`|Used for calculating or counting.|
|**Float**|Any number containing a decimal point.|`0.32`, `83.7823`, `-5.45`|Used for calculating or counting.|
|**Boolean**|Handles true or false values.|`true` or `false`|Used when there are two options for a value.|
|**String**|A collection of letters and symbols known as “characters.”|`'Charles'`, `"Singapore"`, `'cat'`|Used when working with any text wrapped in single or double quotes.|
|`none`|The absence of a value.||Defines a null value.|

## Data Type Conversions

We may be given a data set that stores numbers as strings. So, before we can perform calculations on that data, we’ll need to convert the data type.

To do this, we use built-in functions like the following:

- `float()`
- `int()`
- `str()`

If your data set stores the number `“1”` as a string. To convert it to an integer, we would write:

```
int('1')
```