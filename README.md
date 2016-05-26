# BehindMe

Placing a view behind the scrolling content of a table or 
collection view can be useful when working with 
`UITableViewController` or a `UICollectionViewController` when
you do not have control of the view heirarchy. This sample
project shows how that can be done.

For this example, there was a need to place a screenshot of
the content of the view before changing to a search state so
a blurred and darkened image could appear behind the search
results.

When working with top and bottom bars with table and collection
views it is necessary to adjust for the insets. For this sample
project the top inset is used to push down the screenshot so the
image appears directly behind where the content was when the screenhot
was captured.

### License

MIT

---
Brennan Stehling - 2016