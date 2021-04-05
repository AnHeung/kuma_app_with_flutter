import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuma_flutter_app/app_constants.dart';
import 'package:kuma_flutter_app/bloc/genre_search/genre_search_bloc.dart';
import 'package:kuma_flutter_app/enums/category_click_status.dart';
import 'package:kuma_flutter_app/enums/genre_title.dart';
import 'package:kuma_flutter_app/enums/image_shape_type.dart';
import 'package:kuma_flutter_app/model/genre_data.dart';
import 'package:kuma_flutter_app/model/item/animation_genre_search_item.dart';
import 'package:kuma_flutter_app/util/date_util.dart';
import 'package:kuma_flutter_app/widget/custom_text.dart';
import 'package:kuma_flutter_app/widget/empty_container.dart';
import 'package:kuma_flutter_app/widget/image_item.dart';
import 'package:kuma_flutter_app/widget/loading_indicator.dart';

class GenreSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
    final AppBar appBar = AppBar(
      actions: [Container()],
      title: Text('장르검색'),
    );
    final height = appBar.preferredSize.height;

    return BlocBuilder<GenreSearchBloc, GenreSearchState>(
      builder: (context, state) {
        List<AnimationGenreSearchItem> genreSearchItems =
            state is GenreSearchLoadSuccess ? state.genreSearchItems : [];
        Map<String, CategoryClickStatus> clickMap = state.clickMap;
        GenreData genreData =
            state is GenreSearchLoadSuccess ? state.genreData : GenreData();

        return Stack(
          children: [
            Scaffold(
              key: _key,
              endDrawerEnableOpenDragGesture: false,
              endDrawer: SafeArea(
                child: Drawer(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Container(
                        color: kBlack,
                        width: double.infinity,
                        height: height,
                        child: DrawerHeader(
                          child: Text('Drawer Header'),
                        ),
                      ),
                      TagItems(
                        title: "장르",
                        genreTitle: GenreTitle.GENRE,
                        clickMap: clickMap,
                        genreData: genreData,
                      ),
                      TagItems(
                        title: "연도",
                        genreTitle: GenreTitle.YEAR,
                        clickMap: clickMap,
                        genreData: genreData,
                      )
                    ],
                  ),
                ),
              ),
              appBar: appBar,
              body: Column(
                children: [
                  Container(
                    height: kGenreItemHeight,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        CustomText(
                          fontColor: Colors.black,
                          text: "선택된 필터",
                          fontSize: 14.0,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => _key.currentState.openEndDrawer(),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              padding: EdgeInsets.only(right: 10, left: 10),
                              height: 30,
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomText(
                                    fontWeight: FontWeight.w700,
                                    text: "필터",
                                    fontColor: kWhite,
                                    fontSize: 10.0,
                                  ),
                                  Icon(
                                    Icons.filter_list,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: clickMap.isNotEmpty,
                    child: Container(
                      height: kGenreItemHeight,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: kBlack, width: 0.1),
                              bottom: BorderSide(color: kBlack, width: 0.1))),
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_box,
                            color: Colors.purple,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 25,
                              child: ListView.separated(
                                itemBuilder: (context, idx) {
                                  final String item =
                                      clickMap.keys.elementAt(idx);
                                  return Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            width: 0.5, color: kBlack)),
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: item,
                                          fontSize: 10.0,
                                        ),
                                        Icon(
                                          Icons.close,
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, idx) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: clickMap.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  genreSearchItems.isNotEmpty
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                              scrollDirection: Axis.vertical,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              children: genreSearchItems
                                  .map((data) =>
                                  GestureDetector(
                                    onTap: ()=> print('test'),
                                    child: Container(
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: ImageItem(
                                                  imgRes: data.image,
                                                  type: ImageShapeType.FLAT,
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: CustomText(
                                                  text: data.title,
                                                  maxLines: 2,
                                                  isEllipsis: true,
                                                  textAlign: TextAlign.center,
                                                ))
                                          ],
                                        )),
                                  )
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                      : Expanded(
                          child: EmptyContainer(
                            title: "검색 목록 없음",
                          ),
                        )
                ],
              ),
            ),
            LoadingIndicator(
              isVisible: state is GenreSearchLoadInProgress,
            )
          ],
        );
      },
    );
  }
}

class TagItems extends StatefulWidget {
  final String title;
  final GenreTitle genreTitle;
  final Map<String, CategoryClickStatus> clickMap;
  final GenreData genreData;

  TagItems({this.title, this.genreTitle, this.clickMap, this.genreData});

  @override
  _TagItemsState createState() => _TagItemsState();
}

class _TagItemsState extends State<TagItems> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    Map<String, String> genreMap = _getGenreMap(title: widget.genreTitle);

    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 60,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(widget.title),
                  ),
                  Spacer(),
                  isVisible
                      ? Icon(Icons.arrow_drop_up_outlined)
                      : Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Column(
                  children: genreMap.entries.map((data) {
                String key = data.key;
                String value = data.value;
                CategoryClickStatus status = widget.clickMap.containsKey(key)
                ?widget.clickMap[key]
                :CategoryClickStatus.NONE;
                return CategoryItem(
                  category: key,
                  categoryValue: value,
                  clickMap: widget.clickMap,
                  clickStatus: status,
                  genreTitle: widget.genreTitle,
                  genreData: widget.genreData,
                );
              }).toList()),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, String> _getGenreMap({GenreTitle title}) {
    switch (title) {
      case GenreTitle.GENRE:
        return genreList;
      case GenreTitle.YEAR:
        return getFourYearMapData();
      case GenreTitle.AIR_TYPE:
        return genreList;
      case GenreTitle.AIRING:
        return genreList;
      default:
        return {};
    }
  }
}

class CategoryItem extends StatelessWidget {
  String category;
  String categoryValue;
  Map<String, CategoryClickStatus> clickMap;
  CategoryClickStatus clickStatus;
  final GenreTitle genreTitle;
  GenreData genreData;

  CategoryItem(
      {this.category,
      this.categoryValue,
      this.clickMap,
      this.clickStatus,
      this.genreTitle,
      this.genreData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _changeCategoryStatus(clickStatus);
        GenreData genreData = _getGenreData();
        BlocProvider.of<GenreSearchBloc>(context)
            .add(GenreLoad(data: genreData, clickMap: clickMap));
      },
      child: Container(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(category),
            ),
            Spacer(),
            _changeCategoryIcon(clickStatus)
          ],
        ),
      ),
    );
  }

  _changeCategoryStatus(CategoryClickStatus status) {
    switch (status) {
      case CategoryClickStatus.INCLUDE:
        if (genreTitle == GenreTitle.GENRE) {
          clickMap.update(category, (v) => CategoryClickStatus.EXCLUDE);
          clickStatus = CategoryClickStatus.EXCLUDE;
        } else {
          clickMap..remove(category);
          clickStatus = CategoryClickStatus.NONE;
        }
        break;
      case CategoryClickStatus.EXCLUDE:
        clickMap..remove(category);
        clickStatus = CategoryClickStatus.NONE;
        break;
      case CategoryClickStatus.NONE:
        clickMap..addAll({category: CategoryClickStatus.INCLUDE});
        clickStatus = CategoryClickStatus.INCLUDE;
        break;
    }
  }

  _changeCategoryIcon(CategoryClickStatus status) {
    switch (status) {
      case CategoryClickStatus.INCLUDE:
        return Icon(Icons.check_box);
      case CategoryClickStatus.EXCLUDE:
        return Icon(Icons.indeterminate_check_box_outlined);
      case CategoryClickStatus.NONE:
        return Icon(Icons.check_box_outline_blank);
    }
  }

  _getGenreData() {
    switch (genreTitle) {
      case GenreTitle.GENRE:
        String genre = genreData.genre;
        String genreExclude = genreData.genreExclude;

        if (clickStatus == CategoryClickStatus.EXCLUDE) {
          if (genreExclude.isEmpty) {
            genreExclude = categoryValue;
          } else {
            genreExclude += ",$categoryValue";
          }
        } else if(clickStatus == CategoryClickStatus.INCLUDE){
          if (genre.isEmpty) {
            genre = categoryValue;
          } else {
            genre += ",$categoryValue";
          }
        }else{
            genre = genre.split(",").fold("",(acc,genre){
              if(categoryValue != genre){
                if (acc.isEmpty) {
                  acc = genre;
                } else {
                  acc += ",$genre";
                }
              }
              return acc;
            });
            genreExclude = genreExclude.split(",").fold("",(acc,genreExclude){
              if(categoryValue != genreExclude){
                if (acc.isEmpty) {
                  acc = genreExclude;
                } else {
                  acc += ",$genreExclude";
                }
              }
              return acc;
            });
        }
        // clickMap.entries.forEach((data){
        //
        //   String category = data.key;
        //   CategoryClickStatus categoryStatus = data.value;
        //   String categoryValue = genreList[category];
        //
        //   if(categoryStatus == CategoryClickStatus.EXCLUDE){
        //     if(genreExclude.isEmpty){
        //       genreExclude  = categoryValue;
        //     }else{
        //       genreExclude  += ",$categoryValue";
        //     }
        //   }else{
        //     if(genre.isEmpty){
        //       genre  = categoryValue;
        //     }else{
        //       genre  += ",$categoryValue";
        //     }
        //   }
        // });
        return genreData.copyWith(genre: genre, genreExclude: genreExclude);
      case GenreTitle.YEAR:

        String startDate = categoryValue.split("~").first;
        String endDate = categoryValue.split("~").last;

        if(genreData.startDate.isNotEmpty && genreData.endDate.isNotEmpty){
          if(DateTime.parse(startDate).year > DateTime.parse(genreData.startDate).year)  startDate = genreData.startDate;
          if(DateTime.parse(endDate).year < DateTime.parse(genreData.endDate).year) endDate = genreData.endDate;
        }
        return genreData.copyWith(startDate: startDate, endDate: endDate);
      case GenreTitle.AIRING:
        break;
      case GenreTitle.AIR_TYPE:
        break;
    }
  }
}
