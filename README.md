Horizon Comfort is an e-commerce application built on Flutter technology, designed specifically for shoe shopping.
The app is built using BLoC pattern, which makes it more responsive and efficient.
The use of Firebase and Firestore enhances the overall functionality of the application,
enabling seamless data synchronization and real-time updates.
The app also uses Firebase auth for secure authentication and user management.

Below are some of the key features that are already implemented:

At Home Screen we can scroll through the best products, which we can add
to our list of favourites, or we can navigate to the shoe screen to view more details.
Shoes with the highest user popularity score are shown under Most popular category.
(Shoes with higher rating will be shown higher based on user likes)

![studio64_3nGAEBqO9M](https://user-images.githubusercontent.com/92534783/225074213-856133fd-bee0-4ab3-bf97-35784fabcc1e.gif)

Lets Navigate to shoe screen
Here We can browse through photos, Add shoe to cart, and of course check 
some information about brand condition and excetera.

![studio64_RSYNosZMKh](https://user-images.githubusercontent.com/92534783/225077122-0fae2045-e3a3-4abe-9525-336068abfb17.gif)

At cart screen theres a separated list containing all of the 
shoes currently in cart. The items are dismissable, which deletes them
from cart after swiping them off-screen. Total price of shopping gets
updated after every change.

![studio64_QIgD3IYU3d](https://user-images.githubusercontent.com/92534783/225080091-a9240133-971b-4588-95b9-264efbef9791.gif)

At search screen we can quickly find a specific shoe
For demonstration purposes searchfield updates at < 2 characters
as there are few shoes in the database.

![studio64_EGw9BZmppo](https://user-images.githubusercontent.com/92534783/225083594-cc89be96-8c22-48cb-8a5d-0651c2339b42.gif)

At favourites screen we can see all of our favourite shoes.
Giving a shoe a like/unliking it or dismissing the item from the favourites list 
updates the popularity score of the particular shoe. When we dismiss it from
our favourites the items at Home screen show accordingly red heart - if the item
is in our favourites or an empty heart otherwise.

![studio64_dXtmUFOC75](https://user-images.githubusercontent.com/92534783/225085557-e0c9ff28-cd50-46dc-be91-9002f37565ae.gif)

User screen, from there we can edit our profile or sign out.
clicking "Edit Profile Details" navigates us do edit screen.

![studio64_jUfaTId8HF](https://user-images.githubusercontent.com/92534783/225086854-2dd4f3d0-f0a5-40d4-bbbf-e42e86cfeda3.png)

At Edit User Screen we can update our personal information.
The data is validated and it updates only if the fields are filled correctly.
Text fields are validated upon pressing the Confirm Changes button.

![studio64_a6O1MF54uN](https://user-images.githubusercontent.com/92534783/225088051-0a860952-db46-4b4a-b2f8-ee0cf4876709.png)

After we succesfully updated user information this is our user:

![studio64_sYRphFufUE](https://user-images.githubusercontent.com/92534783/225089726-e3107904-0116-4da5-a784-00bb976ac43c.png)

Now upon pressing Sign Out, user status is now set to authenticated and we are navigated to login screen.

![studio64_GTmccL0sgm](https://user-images.githubusercontent.com/92534783/225090284-934c6cce-7595-4a25-9156-2d6bad48422c.png)

Finally We can create a new user. First lets fill the fields with some invalid data.
Both passwords have to match exactly and other fields have some basic validation as well.

![studio64_yNTVWZGL3O](https://user-images.githubusercontent.com/92534783/225092650-f400f75b-c847-4cee-8851-998a5f035e03.png)

Creating a new user, which email was not in the database automatically gets us logged in.
Upon changing the authorisation status we are then navigated to the menu with the onboarding screen as the initial state.
At user profile screen we can see that everything is set properly.

![studio64_BtGZnsGATK](https://user-images.githubusercontent.com/92534783/225095842-ecd47765-eec2-4d47-98d9-464d3190b421.gif)
