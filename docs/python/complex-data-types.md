# Complex Data Types
1. Lists
2. Tuples
3. Sets
4. Dictionaries

## Lists

Lists are:

- **Ordered**: Their elements have a particular order that will never change.
- **Heterogeneous**: Different data types can be stored for each element in the list. For example, `['cat', 10, 0.4]`.
- **Mutable**: When you alter a list, you don't create a new element — the original element is just modified.

**Note**: It's typical to pluralize the name of a list. For example, `cars`, `animal_names`, and `cities`. This indicates that the name refers to more than one piece of data.

### Tip

`animals = ['bird', 'dog', 'cat']`

Select a value from the list using the index

`animals[0]`

Length of list

`len(animals)`

Replace a value in the list

`animals[0] = 'pig'`

What if we want to add or remove items from a list? That's where our dear friends `append()` and `pop()` help out.

`append()` adds an item to the end of a list.

```
animals = ['bird', 'dog', 'cat']
animals.append('pig')
```

After evaluating both lines, `animal_types` now contains four elements: `['bird', 'dog', 'cat', 'pig']`. 

But what if we decide we don't like `pig` after all?

`pop()` removes an element from a list. You can provide it the specific index to remove, or else it will default to removing the last element from the list.

```
animals = ['bird', 'dog', 'cat', 'pig']
animals.pop()
```

`animals` now contains the original three elements: `['bird', 'dog', 'cat']`

## Tuples

Tuples are **immutable** — you can't alter a tuple element once it's been created.

To define a new tuple, use parentheses instead of brackets:

```
days_of_week = ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
```

### Why use a Tuple

Tuples are used for information that won't change: the days of the week, the months in a year, the configuration settings of an application, the fixed options in a dropdown menu on a form, and more.

## Sets

A **set** is a collection of unordered, **unique** elements. For example, let's say you and I traveled to different places around the world. The data we're trying to capture is where we each went — the sequential order doesn't matter.

```
my_places_traveled = {'Riyadh', 'Jeddah', 'Bahrain'}
your_places_traveled = {'Singapore', 'Riyadh'}
```

To tell Python we're writing a set, we use curly braces `{ }`.

### Why Sets

Computers can more efficiently check to see if an element is in a set. We call this "membership lookup." It takes a lot more energy to search lists in the same way.

Taking advantage of sets means your program runs faster and uses less memory. If you don't have duplicates and you don't need order, use a set.

To check whether an element is in a set, we use the `in` operator.

```
'Riyadh' in my_places_traveled 
True
```

## Dictionaries

Think about a dictionary in real life (not programming life). It's a big old book — or website — with words and definitions that are paired together and easily searchable.

Dictionaries in programming work just like that. They hold **keys** (words) and **values** (their definitions). This means a term can be stored with specific attributes.

For example:

- Names could be paired with ages.
- Months could be paired with the number of days in a month.
- Book titles could be paired with authors.

Check out this example of a dictionary that pairs book titles with their authors:

```
book_authors = {'Moby Dick': 'Herman Melville', 'The Lorax': 'Dr. Seuss', 'The Hobbit': 'J.R.R. Tolkien'}
```

This is a container of what we call **key-value pairs**.

**Pro Tip:** To create an empty set, use the built-in `set()` function (e.g., `untasty_fruits = set()`). Why? Because in Python, curly braces are used for both sets and dictionaries. Empty braces `{}` indicate an empty dictionary.

To create a new key-value pair, we would write:

```
book_authors['Beloved'] = 'Toni Morrison'
```

If `['Beloved']` already exists as a key in our dictionary, the above would update the value to `'Toni Morrison'`.

To access the value of a particular key, we would write:

```
book_authors['The Lorax'] 
```

... which would return `Dr. Seuss`.