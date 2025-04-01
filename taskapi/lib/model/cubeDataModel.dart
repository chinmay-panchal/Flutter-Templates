class CubesModelData {
  List<Cubes>? cubes;

  CubesModelData({this.cubes});

  CubesModelData.fromJson(Map<String, dynamic> json) {
    if (json['cubes'] != null) {
      cubes = <Cubes>[];
      json['cubes'].forEach((v) {
        cubes!.add(new Cubes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cubes != null) {
      data['cubes'] = this.cubes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cubes {
  String? name;
  Annotations? annotations;
  List<Dimensions>? dimensions;
  // List<Null>? namedSets;
  List<Measures>? measures;

  Cubes(
      {this.name,
      this.annotations,
      this.dimensions,
      // this.namedSets,
      this.measures});

  Cubes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    annotations = json['annotations'] != null
        ? new Annotations.fromJson(json['annotations'])
        : null;
    if (json['dimensions'] != null) {
      dimensions = <Dimensions>[];
      json['dimensions'].forEach((v) {
        dimensions!.add(new Dimensions.fromJson(v));
      });
    }
    if (json['named_sets'] != null) {
      // namedSets = <Null>[];
      // json['named_sets'].forEach((v) {
      //   namedSets!.add(new Null.fromJson(v));
      // });
    }
    if (json['measures'] != null) {
      measures = <Measures>[];
      json['measures'].forEach((v) {
        measures!.add(new Measures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.annotations != null) {
      data['annotations'] = this.annotations!.toJson();
    }
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.map((v) => v.toJson()).toList();
    }
    // if (this.namedSets != null) {
    //   data['named_sets'] = this.namedSets!.map((v) => v.toJson()).toList();
    // }
    if (this.measures != null) {
      data['measures'] = this.measures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Annotations {
  String? sourceName;
  String? sourceDescription;
  String? datasetName;
  String? datasetLink;
  String? tableId;
  String? topic;
  String? subtopic;
  String? hideInUi;
  String? hideInMap;
  String? hiddenMeasures;
  String? sourceLink;

  Annotations(
      {this.sourceName,
      this.sourceDescription,
      this.datasetName,
      this.datasetLink,
      this.tableId,
      this.topic,
      this.subtopic,
      this.hideInUi,
      this.hideInMap,
      this.hiddenMeasures,
      this.sourceLink});

  Annotations.fromJson(Map<String, dynamic> json) {
    sourceName = json['source_name'];
    sourceDescription = json['source_description'];
    datasetName = json['dataset_name'];
    datasetLink = json['dataset_link'];
    tableId = json['table_id'];
    topic = json['topic'];
    subtopic = json['subtopic'];
    hideInUi = json['hide_in_ui'];
    hideInMap = json['hide_in_map'];
    hiddenMeasures = json['hidden_measures'];
    sourceLink = json['source_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source_name'] = this.sourceName;
    data['source_description'] = this.sourceDescription;
    data['dataset_name'] = this.datasetName;
    data['dataset_link'] = this.datasetLink;
    data['table_id'] = this.tableId;
    data['topic'] = this.topic;
    data['subtopic'] = this.subtopic;
    data['hide_in_ui'] = this.hideInUi;
    data['hide_in_map'] = this.hideInMap;
    data['hidden_measures'] = this.hiddenMeasures;
    data['source_link'] = this.sourceLink;
    return data;
  }
}

class Dimensions {
  String? name;
  String? caption;
  String? type;
  Annotations2? annotations;
  List<Hierarchies>? hierarchies;

  Dimensions(
      {this.name, this.caption, this.type, this.annotations, this.hierarchies});

  Dimensions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    caption = json['caption'];
    type = json['type'];
    annotations = json['annotations'] != null
        ? new Annotations2.fromJson(json['annotations'])
        : null;
    if (json['hierarchies'] != null) {
      hierarchies = <Hierarchies>[];
      json['hierarchies'].forEach((v) {
        hierarchies!.add(new Hierarchies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['type'] = this.type;
    if (this.annotations != null) {
      data['annotations'] = this.annotations!.toJson();
    }
    if (this.hierarchies != null) {
      data['hierarchies'] = this.hierarchies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Annotations2 {
  String? dimType;
  String? isRequired;
  String? isAggregatable;
  String? xwalk;
  String? defaultYear;
  String? hideInUi;

  Annotations2(
      {this.dimType,
      this.isRequired,
      this.isAggregatable,
      this.xwalk,
      this.defaultYear,
      this.hideInUi});

  Annotations2.fromJson(Map<String, dynamic> json) {
    dimType = json['dim_type'];
    isRequired = json['is_required'];
    isAggregatable = json['is_aggregatable'];
    xwalk = json['xwalk'];
    defaultYear = json['default_year'];
    hideInUi = json['hide_in_ui'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dim_type'] = this.dimType;
    data['is_required'] = this.isRequired;
    data['is_aggregatable'] = this.isAggregatable;
    data['xwalk'] = this.xwalk;
    data['default_year'] = this.defaultYear;
    data['hide_in_ui'] = this.hideInUi;
    return data;
  }
}

class Hierarchies {
  String? name;
  bool? hasAll;
  String? allMemberName;
  List<Levels>? levels;

  Hierarchies({this.name, this.hasAll, this.allMemberName, this.levels});

  Hierarchies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hasAll = json['has_all'];
    allMemberName = json['all_member_name'];
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['has_all'] = this.hasAll;
    data['all_member_name'] = this.allMemberName;
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Levels {
  String? name;
  String? fullName;
  int? depth;
  String? caption;
  Annotations? annotations;
  List<String>? properties;

  Levels(
      {this.name,
      this.fullName,
      this.depth,
      this.caption,
      this.annotations,
      this.properties});

  Levels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
    depth = json['depth'];
    caption = json['caption'];
    annotations = json['annotations'] != null
        ? new Annotations.fromJson(json['annotations'])
        : null;
    properties = json['properties'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['depth'] = this.depth;
    data['caption'] = this.caption;
    if (this.annotations != null) {
      data['annotations'] = this.annotations!.toJson();
    }
    data['properties'] = this.properties;
    return data;
  }
}

class Measures {
  String? name;
  String? caption;
  Annotations3? annotations;
  String? fullName;
  String? aggregator;

  Measures(
      {this.name,
      this.caption,
      this.annotations,
      this.fullName,
      this.aggregator});

  Measures.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    caption = json['caption'];
    annotations = json['annotations'] != null
        ? new Annotations3.fromJson(json['annotations'])
        : null;
    fullName = json['full_name'];
    aggregator = json['aggregator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['caption'] = this.caption;
    if (this.annotations != null) {
      data['annotations'] = this.annotations!.toJson();
    }
    data['full_name'] = this.fullName;
    data['aggregator'] = this.aggregator;
    return data;
  }
}

class Annotations3 {
  String? aggregationMethod;
  String? unitsOfMeasurement;
  String? hideInMap;
  String? uiDefaultDrilldown;
  String? errorForMeasure;
  String? errorType;
  String? preAggregationMethod;
  String? hideInUi;
  String? rcaMeasure;
  String? rcaDimensions;
  String? details;
  String? aggregator;
  String? membersToHide;
  String? sourceForMeasure;
  String? collectionForMeasure;
  String? subtopic;

  Annotations3(
      {this.aggregationMethod,
      this.unitsOfMeasurement,
      this.hideInMap,
      this.uiDefaultDrilldown,
      this.errorForMeasure,
      this.errorType,
      this.preAggregationMethod,
      this.hideInUi,
      this.rcaMeasure,
      this.rcaDimensions,
      this.details,
      this.aggregator,
      this.membersToHide,
      this.sourceForMeasure,
      this.collectionForMeasure,
      this.subtopic});

  Annotations3.fromJson(Map<String, dynamic> json) {
    aggregationMethod = json['aggregation_method'];
    unitsOfMeasurement = json['units_of_measurement'];
    hideInMap = json['hide_in_map'];
    uiDefaultDrilldown = json['ui_default_drilldown'];
    errorForMeasure = json['error_for_measure'];
    errorType = json['error_type'];
    preAggregationMethod = json['pre_aggregation_method'];
    hideInUi = json['hide_in_ui'];
    rcaMeasure = json['rca_measure'];
    rcaDimensions = json['rca_dimensions'];
    details = json['details'];
    aggregator = json['aggregator'];
    membersToHide = json['members_to_hide'];
    sourceForMeasure = json['source_for_measure'];
    collectionForMeasure = json['collection_for_measure'];
    subtopic = json['subtopic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aggregation_method'] = this.aggregationMethod;
    data['units_of_measurement'] = this.unitsOfMeasurement;
    data['hide_in_map'] = this.hideInMap;
    data['ui_default_drilldown'] = this.uiDefaultDrilldown;
    data['error_for_measure'] = this.errorForMeasure;
    data['error_type'] = this.errorType;
    data['pre_aggregation_method'] = this.preAggregationMethod;
    data['hide_in_ui'] = this.hideInUi;
    data['rca_measure'] = this.rcaMeasure;
    data['rca_dimensions'] = this.rcaDimensions;
    data['details'] = this.details;
    data['aggregator'] = this.aggregator;
    data['members_to_hide'] = this.membersToHide;
    data['source_for_measure'] = this.sourceForMeasure;
    data['collection_for_measure'] = this.collectionForMeasure;
    data['subtopic'] = this.subtopic;
    return data;
  }
}
