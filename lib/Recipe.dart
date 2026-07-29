// import 'package:flutter/material.dart';

// class RecipeDetailsScreen extends StatelessWidget {
//   const RecipeDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 300,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.network(
//                 recipe.image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(recipe.title),
//                   Text(recipe.description),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
