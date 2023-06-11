import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  
    int id;
    CourseOwner courseOwner;
    int enrolledStudents;
    bool isFree;
    CourseRating courseRating;
    String courseDuration;
    int videoCount;
    int commentsCount;
    int viewsCount;
    String name;
    Type type;
    Lang lang;
    String level;
    String? keyWords;
    String whatToLearn;
    String whomThisCourse;
    int price;
    String shortDescr;
    String recommendation;
    String? exchangeUrl;
    DateTime createdAt;
    DateTime updatedAt;
    int discountPrice;
    String coverImg;
    String trailerFile;
    String? trailerUrl;
    bool isTop;
    bool isBest;
    IsValid isValid;
    int category;
    int subcategory;

    Course({
        required this.id,
        required this.courseOwner,
        required this.enrolledStudents,
        required this.isFree,
        required this.courseRating,
        required this.courseDuration,
        required this.videoCount,
        required this.commentsCount,
        required this.viewsCount,
        required this.name,
        required this.type,
        required this.lang,
        required this.level,
        this.keyWords,
        required this.whatToLearn,
        required this.whomThisCourse,
        required this.price,
        required this.shortDescr,
        required this.recommendation,
        this.exchangeUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.discountPrice,
        required this.coverImg,
        required this.trailerFile,
        this.trailerUrl,
        required this.isTop,
        required this.isBest,
        required this.isValid,
        required this.category,
        required this.subcategory,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseOwner: CourseOwner.fromJson(json["course_owner"]),
        enrolledStudents: json["enrolled_students"],
        isFree: json["is_free"],
        courseRating: CourseRating.fromJson(json["course_rating"]),
        courseDuration: json["course_duration"],
        videoCount: json["video_count"],
        commentsCount: json["comments_count"],
        viewsCount: json["views_count"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        lang: langValues.map[json["lang"]]!,
        level: json["level"],
        keyWords: json["key_words"],
        whatToLearn: json["what_to_learn"],
        whomThisCourse: json["whom_this_course"],
        price: json["price"],
        shortDescr: json["short_descr"],
        recommendation: json["recommendation"],
        exchangeUrl: json["exchange_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        discountPrice: json["discount_price"],
        coverImg: json["cover_img"],
        trailerFile: json["trailer_file"],
        trailerUrl: json["trailer_url"],
        isTop: json["is_top"],
        isBest: json["is_best"],
        isValid: isValidValues.map[json["is_valid"]]!,
        category: json["category"],
        subcategory: json["subcategory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_owner": courseOwner.toJson(),
        "enrolled_students": enrolledStudents,
        "is_free": isFree,
        "course_rating": courseRating.toJson(),
        "course_duration": courseDuration,
        "video_count": videoCount,
        "comments_count": commentsCount,
        "views_count": viewsCount,
        "name": name,
        "type": typeValues.reverse[type],
        "lang": langValues.reverse[lang],
        "level": level,
        "key_words": keyWords,
        "what_to_learn": whatToLearn,
        "whom_this_course": whomThisCourse,
        "price": price,
        "short_descr": shortDescr,
        "recommendation": recommendation,
        "exchange_url": exchangeUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "discount_price": discountPrice,
        "cover_img": coverImg,
        "trailer_file": trailerFile,
        "trailer_url": trailerUrl,
        "is_top": isTop,
        "is_best": isBest,
        "is_valid": isValidValues.reverse[isValid],
        "category": category,
        "subcategory": subcategory,
    };
}

class CourseOwner {
    int id;
    String fullName;
    String profilePicture;

    CourseOwner({
        required this.id,
        required this.fullName,
        required this.profilePicture,
    });

    factory CourseOwner.fromJson(Map<String, dynamic> json) => CourseOwner(
        id: json["id"],
        fullName: json["full_name"],
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_picture": profilePicture,
    };
}

class CourseRating {
    String rating;
    int votersNumber;
    int fiveRating;
    int fourRating;
    int threeRating;
    int twoRating;
    int oneRating;

    CourseRating({
        required this.rating,
        required this.votersNumber,
        required this.fiveRating,
        required this.fourRating,
        required this.threeRating,
        required this.twoRating,
        required this.oneRating,
    });

    factory CourseRating.fromJson(Map<String, dynamic> json) => CourseRating(
        rating: json["rating"],
        votersNumber: json["voters_number"],
        fiveRating: json["five_rating"],
        fourRating: json["four_rating"],
        threeRating: json["three_rating"],
        twoRating: json["two_rating"],
        oneRating: json["one_rating"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "voters_number": votersNumber,
        "five_rating": fiveRating,
        "four_rating": fourRating,
        "three_rating": threeRating,
        "two_rating": twoRating,
        "one_rating": oneRating,
    };
}

enum IsValid { VALID }

final isValidValues = EnumValues({
    "VALID": IsValid.VALID
});

enum Lang { O_ZBEKCHA }

final langValues = EnumValues({
    "O'zbekcha": Lang.O_ZBEKCHA
});

enum Type { PAID }

final typeValues = EnumValues({
    "PAID": Type.PAID
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}