/// The Syncfusion Flutter PDF is a library written natively in Dart for
/// creating, reading, editing, and securing PDF files in Android, iOS,
/// and web platforms.
library pdf;

import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

part 'src/pdf/implementation/pdf_document/pdf_document.dart';
part 'src/pdf/implementation/pdf_document/pdf_catalog.dart';
part 'src/pdf/implementation/pdf_document/enums.dart';
part 'src/pdf/implementation/pdf_document/pdf_file_structure.dart';
part 'src/pdf/implementation/pdf_document/pdf_document_template.dart';
part 'src/pdf/interfaces/pdf_primitive.dart';
part 'src/pdf/interfaces/pdf_wrapper.dart';
part 'src/pdf/implementation/primitives/pdf_name.dart';
part 'src/pdf/implementation/primitives/pdf_dictionary.dart';
part 'src/pdf/interfaces/pdf_changable.dart';
part 'src/pdf/interfaces/pdf_writer.dart';
part 'src/pdf/implementation/primitives/pdf_number.dart';
part 'src/pdf/implementation/primitives/pdf_boolean.dart';
part 'src/pdf/implementation/primitives/pdf_array.dart';
part 'src/pdf/implementation/pages/pdf_page_collection.dart';
part 'src/pdf/implementation/pages/pdf_page.dart';
part 'src/pdf/implementation/pages/enum.dart';
part 'src/pdf/implementation/pages/pdf_section.dart';
part 'src/pdf/implementation/pages/pdf_section_template.dart';
part 'src/pdf/implementation/pages/pdf_page_settings.dart';
part 'src/pdf/implementation/pages/pdf_section_collection.dart';
part 'src/pdf/implementation/pages/pdf_page_layer_collection.dart';
part 'src/pdf/implementation/pages/pdf_page_layer.dart';
part 'src/pdf/implementation/pages/pdf_page_template_element.dart';
part 'src/pdf/implementation/drawing/drawing.dart';
part 'src/pdf/implementation/drawing/color.dart';
part 'src/pdf/implementation/graphics/pdf_margins.dart';
part 'src/pdf/implementation/graphics/pdf_resources.dart';
part 'src/pdf/implementation/graphics/pdf_graphics.dart';
part 'src/pdf/implementation/graphics/pdf_graphics_state.dart';
part 'src/pdf/implementation/graphics/pdf_transformation_matrix.dart';
part 'src/pdf/implementation/graphics/pdf_pen.dart';
part 'src/pdf/implementation/graphics/pdf_pens.dart';
part 'src/pdf/implementation/graphics/pdf_color.dart';
part 'src/pdf/implementation/graphics/figures/pdf_template.dart';
part 'src/pdf/implementation/graphics/figures/enums.dart';
part 'src/pdf/implementation/graphics/figures/pdf_text_element.dart';
part 'src/pdf/implementation/graphics/figures/base/element_layouter.dart';
part 'src/pdf/implementation/graphics/figures/base/text_layouter.dart';
part 'src/pdf/implementation/graphics/figures/base/layout_element.dart';
part 'src/pdf/implementation/primitives/pdf_null.dart';
part 'src/pdf/implementation/primitives/pdf_stream.dart';
part 'src/pdf/implementation/primitives/pdf_reference.dart';
part 'src/pdf/implementation/primitives/pdf_reference_holder.dart';
part 'src/pdf/implementation/primitives/pdf_string.dart';
part 'src/pdf/implementation/io/cross_table.dart';
part 'src/pdf/implementation/io/dictionary_properties.dart';
part 'src/pdf/implementation/io/pdf_main_object_collection.dart';
part 'src/pdf/implementation/io/object_info.dart';
part 'src/pdf/implementation/io/pdf_cross_table.dart';
part 'src/pdf/implementation/io/pdf_writer.dart';
part 'src/pdf/implementation/io/pdf_reader.dart';
part 'src/pdf/implementation/io/pdf_parser.dart';
part 'src/pdf/implementation/io/pdf_lexer.dart';
part 'src/pdf/implementation/io/stream_reader.dart';
part 'src/pdf/implementation/io/pdf_stream_writer.dart';
part 'src/pdf/implementation/io/enums.dart';
part 'src/pdf/implementation/io/pdf_operators.dart';
part 'src/pdf/implementation/io/decode_big_endian.dart';
part 'src/pdf/implementation/general/pdf_collection.dart';
part 'src/pdf/implementation/graphics/pdf_transparency.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_font.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_standard_font.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_font_metrics.dart';
part 'src/pdf/implementation/graphics/fonts/enums.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_string_format.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_standard_font_metrics_factory.dart';
part 'src/pdf/implementation/graphics/enums.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_cjk_standard_font.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_cjk_standard_font_metrics_factory.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_string_layouter.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_string_layout_result.dart';
part 'src/pdf/implementation/graphics/fonts/string_tokenizer.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_cid_font.dart';
part 'src/pdf/implementation/graphics/brushes/pdf_brush.dart';
part 'src/pdf/implementation/graphics/brushes/pdf_solid_brush.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_automatic_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_automatic_field_info.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_dynamic_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_composite_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_multiple_value_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_template_value_pair.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_page_number_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_single_value_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_page_count_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_static_field.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_date_time_field.dart';
part 'src/pdf/implementation/io/big_endian_writer.dart';
part 'src/pdf/implementation/graphics/fonts/pdf_true_type_font.dart';
part 'src/pdf/implementation/graphics/fonts/ttf_reader.dart';
part 'src/pdf/implementation/graphics/fonts/ttf_metrics.dart';
part 'src/pdf/implementation/graphics/fonts/unicode_true_type_font.dart';
part 'src/pdf/implementation/graphics/fonts/ttf_helper.dart';
part 'src/pdf/implementation/graphics/images/pdf_image.dart';
part 'src/pdf/implementation/graphics/images/enum.dart';
part 'src/pdf/implementation/graphics/images/decoders/image_decoder.dart';
part 'src/pdf/implementation/graphics/images/decoders/jpeg_decoder.dart';
part 'src/pdf/implementation/graphics/images/decoders/png_decoder.dart';
part 'src/pdf/implementation/graphics/images/pdf_bitmap.dart';
part 'src/pdf/implementation/structured_elements/lists/pdf_list.dart';
part 'src/pdf/implementation/structured_elements/lists/pdf_ordered_list.dart';
part 'src/pdf/implementation/structured_elements/lists/pdf_unordered_list.dart';
part 'src/pdf/implementation/structured_elements/lists/pdf_list_layouter.dart';
part 'src/pdf/implementation/structured_elements/lists/pdf_list_item.dart';
part 'src/pdf/implementation/structured_elements/lists/pdf_list_item_collection.dart';
part 'src/pdf/implementation/structured_elements/lists/bullets/pdf_marker.dart';
part 'src/pdf/implementation/structured_elements/lists/bullets/pdf_ordered_marker.dart';
part 'src/pdf/implementation/structured_elements/lists/bullets/pdf_unordered_marker.dart';
part 'src/pdf/implementation/structured_elements/lists/bullets/enums.dart';
part 'src/pdf/implementation/structured_elements/grid/pdf_grid.dart';
part 'src/pdf/implementation/structured_elements/grid/pdf_grid_column.dart';
part 'src/pdf/implementation/structured_elements/grid/pdf_grid_row.dart';
part 'src/pdf/implementation/structured_elements/grid/pdf_grid_cell.dart';
part 'src/pdf/implementation/structured_elements/grid/enums.dart';
part 'src/pdf/implementation/structured_elements/grid/styles/style.dart';
part 'src/pdf/implementation/structured_elements/grid/styles/pdf_borders.dart';
part 'src/pdf/implementation/structured_elements/grid/layouting/pdf_grid_layouter.dart';
part 'src/pdf/implementation/pdf_document/automatic_fields/pdf_destination_page_number_field.dart';
part 'src/pdf/implementation/graphics/fonts/rtl/arabic_shape_renderer.dart';
part 'src/pdf/implementation/graphics/fonts/rtl/bidi.dart';
part 'src/pdf/implementation/annotations/pdf_annotation.dart';
part 'src/pdf/implementation/annotations/enum.dart';
part 'src/pdf/implementation/actions/pdf_action.dart';
part 'src/pdf/implementation/actions/pdf_uri_action.dart';
part 'src/pdf/implementation/annotations/pdf_uri_annotation.dart';
part 'src/pdf/implementation/annotations/pdf_text_web_link.dart';
part 'src/pdf/implementation/annotations/pdf_annotation_collection.dart';
part 'src/pdf/implementation/annotations/pdf_action_annotation.dart';
part 'src/pdf/implementation/annotations/pdf_annotation_border.dart';
part 'src/pdf/implementation/general/pdf_destination.dart';
part 'src/pdf/implementation/general/pdf_named_destination.dart';
part 'src/pdf/implementation/general/pdf_named_destination_collection.dart';
part 'src/pdf/implementation/general/enum.dart';
part 'src/pdf/implementation/annotations/pdf_document_link_annotation.dart';
part 'src/pdf/implementation/pdf_document/outlines/pdf_outline.dart';
part 'src/pdf/implementation/pdf_document/outlines/pdf_outline_base.dart';
part 'src/pdf/implementation/pdf_document/outlines/enums.dart';
part 'src/pdf/implementation/graphics/figures/base/pdf_shape_element.dart';
part 'src/pdf/implementation/graphics/figures/base/shape_layouter.dart';
part 'src/pdf/implementation/graphics/figures/pdf_path.dart';
part 'src/pdf/implementation/graphics/figures/pdf_bezier_curve.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/parser/content_lexer.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/parser/content_parser.dart';
part 'src/pdf/implementation/io/pdf_archive_stream.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/font_structure.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/font_file2.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/page_resource_loader.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/pdf_text_extractor.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/xobject_element.dart';
part 'src/pdf/implementation/annotations/pdf_rectangle_annotation.dart';
part 'src/pdf/implementation/annotations/pdf_polygon_annotation.dart';
part 'src/pdf/implementation/annotations/pdf_ellipse_annotation.dart';
part 'src/pdf/implementation/annotations/pdf_line_annotation.dart';
part 'src/pdf/implementation/annotations/pdf_paintparams.dart';
part 'src/pdf/implementation/annotations/pdf_appearance.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/text_line.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/text_word.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/text_glyph.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/matched_item.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/image_renderer.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/graphic_object_data.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/matrix_helper.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/glyph.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/text_element.dart';
part 'src/pdf/implementation/exporting/pdf_text_extractor/graphic_object_data_collection.dart';
part 'src/pdf/implementation/pdf_document/pdf_document_information.dart';
part 'src/pdf/implementation/xmp/xmp_metadata.dart';
part 'src/pdf/implementation/color_space/pdf_icc_color_profile.dart';
part 'src/pdf/implementation/pages/pdf_layer_collection.dart';
part 'src/pdf/implementation/pages/pdf_layer.dart';
part 'src/pdf/implementation/pdf_document/pdf_catalog_names.dart';
part 'src/pdf/implementation/pdf_document/attachments/pdf_attachment.dart';
part 'src/pdf/implementation/pdf_document/attachments/pdf_attachment_collection.dart';
part 'src/pdf/implementation/general/embedded_file.dart';
part 'src/pdf/implementation/general/embedded_file_specification.dart';
part 'src/pdf/implementation/general/file_specification_base.dart';
part 'src/pdf/implementation/general/embedded_file_params.dart';
part 'src/pdf/implementation/forms/enum.dart';
part 'src/pdf/implementation/forms/pdf_form.dart';
part 'src/pdf/implementation/forms/pdf_field.dart';
part 'src/pdf/implementation/forms/pdf_form_field_collection.dart';
part 'src/pdf/implementation/forms/pdf_text_box_field.dart';
part 'src/pdf/implementation/forms/pdf_field_painter.dart';
part 'src/pdf/implementation/annotations/widget_annotation.dart';
part 'src/pdf/implementation/annotations/widget_appearance.dart';
part 'src/pdf/implementation/general/pdf_default_appearance.dart';
part 'src/pdf/implementation/forms/pdf_check_field_base.dart';
part 'src/pdf/implementation/annotations/appearance/pdf_appearance_state.dart';
part 'src/pdf/implementation/annotations/appearance/pdf_extended_appearance.dart';
part 'src/pdf/implementation/forms/pdf_check_box_field.dart';
part 'src/pdf/implementation/forms/pdf_radio_button_item_collection.dart';
part 'src/pdf/implementation/forms/pdf_radio_button_list_field.dart';
part 'src/pdf/implementation/forms/pdf_radio_button_list_item.dart';
part 'src/pdf/implementation/forms/pdf_list_field.dart';
part 'src/pdf/implementation/forms/pdf_list_field_item.dart';
part 'src/pdf/implementation/forms/pdf_list_field_item_collection.dart';
part 'src/pdf/implementation/forms/pdf_combo_box_field.dart';
part 'src/pdf/implementation/forms/pdf_list_box_field.dart';
part 'src/pdf/implementation/forms/pdf_button_field.dart';
part 'src/pdf/implementation/actions/pdf_annotation_action.dart';
part 'src/pdf/implementation/actions/pdf_field_actions.dart';
part 'src/pdf/implementation/actions/pdf_submit_action.dart';
part 'src/pdf/implementation/forms/pdf_signature_field.dart';
part 'src/pdf/implementation/forms/pdf_field_item.dart';
part 'src/pdf/implementation/forms/pdf_field_item_collection.dart';
part 'src/pdf/implementation/forms/pdf_xfdf_document.dart';

/// Compression
part 'src/pdf/implementation/compression/compressed_stream_writer.dart';
part 'src/pdf/implementation/compression/compressor_huffman_tree.dart';
part 'src/pdf/implementation/compression/enums.dart';
part 'src/pdf/implementation/compression/deflate/deflate_stream.dart';
part 'src/pdf/implementation/compression/deflate/in_buffer.dart';
part 'src/pdf/implementation/compression/deflate/huffman_tree.dart';
part 'src/pdf/implementation/compression/deflate/in_flatter.dart';
part 'src/pdf/implementation/compression/deflate/decompressed_output.dart';
part 'src/pdf/implementation/compression/pdf_zlib_compressor.dart';
part 'src/pdf/implementation/compression/compressed_stream_reader.dart';
part 'src/pdf/implementation/compression/decompressor_huffman_tree.dart';
part 'src/pdf/implementation/compression/pdf_png_filter.dart';

/// Security
part 'src/pdf/implementation/security/pdf_security.dart';
part 'src/pdf/implementation/security/pdf_encryptor.dart';
part 'src/pdf/implementation/security/enum.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/aes_engine.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/aes_cipher.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/cipher_block_chaining_mode.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/cipher_utils.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/data_encryption.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/data_ede_algorithm.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/rc2_algorithm.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/rsa_algorithm.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/pkcs1_encoding.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/ipadding.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/buffered_block_padding_base.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/rmd_signer.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/pdf_cms_signer.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/random_array.dart';
part 'src/pdf/implementation/security/digital_signature/cryptography/signature_utilities.dart';
part 'src/pdf/implementation/security/digital_signature/pkcs/pfx_data.dart';
part 'src/pdf/implementation/security/digital_signature/pkcs/password_utility.dart';
part 'src/pdf/implementation/security/digital_signature/asn1/asn1.dart';
part 'src/pdf/implementation/security/digital_signature/asn1/asn1_stream.dart';
part 'src/pdf/implementation/security/digital_signature/asn1/asn1_parser.dart';
part 'src/pdf/implementation/security/digital_signature/asn1/ber.dart';
part 'src/pdf/implementation/security/digital_signature/asn1/der.dart';
part 'src/pdf/implementation/security/digital_signature/asn1/enum.dart';
part 'src/pdf/implementation/security/digital_signature/x509/x509_certificates.dart';
part 'src/pdf/implementation/security/digital_signature/x509/x509_name.dart';
part 'src/pdf/implementation/security/digital_signature/x509/x509_time.dart';
part 'src/pdf/implementation/security/digital_signature/pdf_certificate.dart';
part 'src/pdf/implementation/security/digital_signature/pdf_pkcs_certificate.dart';
part 'src/pdf/implementation/security/digital_signature/pdf_signature.dart';
part 'src/pdf/implementation/security/digital_signature/pdf_signature_dictionary.dart';
part 'src/pdf/implementation/security/digital_signature/pdf_external_signer.dart';
