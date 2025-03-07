import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yay_app/models/camping_place.dart';
import 'package:flutter_yay_app/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampingPage extends StatelessWidget {
  const CampingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  헤더
        Image.network(
          'https://picsum.photos/1000',
          fit: BoxFit.cover,
          height: 300,
          width: 500,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '필터',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.format_list_bulleted_rounded,
                    color: Colors.grey,
                    size: 15,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '평점순',
                    style: textTheme().bodySmall,
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCampingFilterIcon(FontAwesomeIcons.tree, '숲'),
            _buildCampingFilterIcon(FontAwesomeIcons.swimmingPool, '물놀이장'),
            _buildCampingFilterIcon(FontAwesomeIcons.water, '계곡 물놀이'),
            _buildCampingFilterIcon(FontAwesomeIcons.umbrellaBeach, '해수욕'),
            _buildCampingFilterIcon(FontAwesomeIcons.car, '차박'),
            _buildCampingFilterIcon(FontAwesomeIcons.dog, '반려동물'),
          ],
        ),
        Divider(
          thickness: 0.1,
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: List.generate(placeList.length,
                (index) => _buildCampingPlaceListTile(placeList[index])),
          ),
        ),
      ],
    );
  }

  Widget _buildCampingFilterIcon(IconData mIcon, String title) {
    return Container(
      width: 70,
      child: Column(
        children: [
          Icon(
            mIcon,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildCampingPlaceListTile(CampingPlace place) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          place.image,
        ),
      ),
      title: Text(place.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.address,
            style: textTheme().bodyMedium,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.blueAccent.withOpacity(0.5),
                size: 15,
              ),
              const SizedBox(width: 5),
              Text(
                '${place.star}',
                style: textTheme().bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
