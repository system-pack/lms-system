package util.converter;

import org.modelmapper.ModelMapper;

public class ModelMapperUtil {

  private static ModelMapper modelMapper = null;

  public static ModelMapper getInstance() {

    if (modelMapper == null) {
      modelMapper = new ModelMapper();
    }

    return modelMapper;
  }

}
