# MOOVS Project

> The objective of this project is to demonstrate a way to develop iOS applications.


## Mocks and Prototypes

https://marvelapp.com/c6h9g9h/screen/59390637


## App requiredments
---

- See movies
	- Popular
	- Top Rated
	- Upcoming
- See series
	- Popular
	- Top Rated
	- Upcoming
- Detail of items

## Usage

### Required

This app use CocoaPods, is required install the pods before run application.

> YoutubePlayer modifications

### Environment 

To set environmet you have to go to /MOOVSTesting/AppConfiguration/ConfigurationAppConfiguration.swift
in the line 13 you can choose the environment (Development,QA,Production)

Example: 

```swift

/// App environment
let environment: Environment = .development

```

### Mocks

You can use this app with mock data

To configurate mock data you have to go to /MOOVSTesting/AppConfiguration/ServiceLocator
In the line 12 of the document, you can set if you want use mocks with a boolean flag

Example:

```swift
let useMocks:Bool = true
```


## API Used
---

|Name |Method|URL|Description|
|-----|----|---|----|
|Movie|GET|https://api.themoviedb.org/3/movie/{MOVIE_ID}|Get the movie by id|
|TV Show|GET|https://api.themoviedb.org/3/tv/{TV_ID}|Get the TV Show by id|
|Image|GET|https://image.tmdb.org/t/p/w500/{IMAGE}|Get image|
|Pupular|GET|https://api.themoviedb.org/3/{MEDIA_TYPE}/popular|Get popular media |
|Top rated|GET|https://api.themoviedb.org/3/{MEDIA_TYPE}/top_rated|Get top rated media |
|Upcoming|GET|https://api.themoviedb.org/3/{MEDIA_TYPE}/upcoming|Get upcoming media 

## Frequently Asked Question
---

- [Unity responsibility](#unity-responsability)
- [Best practices](#best-practices)


### Unity responsibility

Complying with the SOLID pattern, we can be sure that our code has good bases, that helps us make the code readable, that can perform updates and integrations of new functions without affecting any other software module   


### Best practices

- Simple code, always look for the best implementation.
- Commented code in English, so far it is a universal way to understand code.
- With a good organization and planning, we can have a greater panorama of what will be developed, that way we can structure the code in the most reusable way to save development time. 
