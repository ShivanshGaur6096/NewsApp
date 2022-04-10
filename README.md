# NewsApp
An iOS Application completely written in Swift 5.0 on MVC architectural pattern, supporting iOS 14.0+ devices. 
<br />
OverView of Application<br />
This is a simple two page App but more of "implement my learnings app" as an iOS Application developers.
One feature nowadays every application should have VoiceOver Accessibility for our physically challenged users is added to the Application form early stage.<br />
It is capable of showing news from five different trending as well as reliable sources i.e. Apple News, Tesla News, Bussiness News, TechCrunch News and WallStret News.<br />
The Source of data is <a href = "https://newsapi.org/">News API</a>.
<br />
** Note: No external framework is needed to install to use this application on your system
<br />
<br />
Working of Application <br />
This App fired-up with a Launch Screen aka Splash with a App Logo on it and as soon as data received and loaded into Table View Cells,
the Landing Screen named Fresh News (NewsListingViewController) is presented to the user.<br />
On Landing screen you can see news headlines (~20 News) presented on Custom Reusable UITableviewCell XIB which Contain Headline, Source of the NEWS the small image for reference and a button to favourite or make that news available offline (feature under development).<br />
I know nowdays we don’t have time through whole news but if headline of any news look interesting I would suggest you to click on it and you will be nevigated to the second screen of the application which is Detail News (DetailNewsViewController) contains different sections.<br />
In Header section you will see the News banner, News Title and the Publisher with date on which news is published. In next, middle section you will se description of the news and a "Read More" button. If the descriptions is not sufficient you can click on Read more button and the new will be shown to you in your default web browser.
<br />
Special work done in application:<br />
1. VoiceOver Accessibility for our physically challenged users.
2. Enhanced MVC Architecture to make app more discoverable to fellow developers.
3. Internationally Coading Guidelines were followed while developing this application.
4. <a href = "https://github.com/realm/SwiftLint">SwiftLint</a> an open-source tool to enforce Swift style and conventions developed by realm is used.
5. The Don't Repeat Yourself (DRY) principle implemented so that duplication in logic should be eliminated via abstraction and "AppConstant" file.
<br />
WIP<br />
1. Updating UI
2. For now only two type of News can be seen. Adding a section of landing screen to choose news by clicking on type. For now by default Apple News were shown on launch and Business News can be seen by clicking Reload button at top-right of screen.
3. The bottom section on Detail News Page will be having sharing options to share news via different social media and messaging platforms. 
4. Make News Offline
5. Add network reachability.
6. Add weather widget on Home Screen.
