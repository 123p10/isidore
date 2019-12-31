; ModuleID = 'test_lexer.cpp'
source_filename = "test_lexer.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ifstream" = type { %"class.std::basic_istream.base", %"class.std::basic_filebuf", %"class.std::basic_ios" }
%"class.std::basic_istream.base" = type { i32 (...)**, i64 }
%"class.std::basic_filebuf" = type { %"class.std::basic_streambuf", %union.pthread_mutex_t, %"class.std::__basic_file", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i64, i8, i8, i8, i8, i8*, i8*, i8, %"class.std::codecvt"*, i8*, i64, i8*, i8* }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__basic_file" = type <{ %struct._IO_FILE*, i8, [7 x i8] }>
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%"class.std::codecvt" = type { %"class.std::__codecvt_abstract_base.base", %struct.__locale_struct* }
%"class.std::__codecvt_abstract_base.base" = type { %"class.std::locale::facet.base" }
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%class.CodeGenerator = type { %"class.std::map", %"class.std::unique_ptr"*, %"class.llvm::LLVMContext"*, %"class.llvm::IRBuilder"*, %"class.std::map.75", %"class.std::unique_ptr.80"*, %"class.std::unique_ptr.81"*, %"class.std::map.82"* }
%"class.std::map" = type { %"class.std::_Rb_tree" }
%"class.std::_Rb_tree" = type { %"struct.std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, int>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, int> >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, int> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, int>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, int> >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, int> > >::_Rb_tree_impl" = type { %"struct.std::_Rb_tree_key_compare", %"struct.std::_Rb_tree_header" }
%"struct.std::_Rb_tree_key_compare" = type { %"struct.std::less" }
%"struct.std::less" = type { i8 }
%"struct.std::_Rb_tree_header" = type { %"struct.std::_Rb_tree_node_base", i64 }
%"struct.std::_Rb_tree_node_base" = type { i32, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"*, %"struct.std::_Rb_tree_node_base"* }
%"class.std::unique_ptr" = type { %"class.std::__uniq_ptr_impl" }
%"class.std::__uniq_ptr_impl" = type { %"class.std::tuple" }
%"class.std::tuple" = type { %"struct.std::_Tuple_impl" }
%"struct.std::_Tuple_impl" = type { %"struct.std::_Head_base.1" }
%"struct.std::_Head_base.1" = type { %"class.llvm::Module"* }
%"class.llvm::Module" = type { %"class.llvm::LLVMContext"*, %"class.llvm::SymbolTableList", %"class.llvm::SymbolTableList.2", %"class.llvm::SymbolTableList.10", %"class.llvm::SymbolTableList.18", %"class.llvm::iplist", %"class.std::__cxx11::basic_string", %"class.llvm::ValueSymbolTable"*, %"class.llvm::StringMap", %"class.std::unique_ptr.36", %"class.std::unique_ptr.45", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", i8*, %"class.llvm::DataLayout" }
%"class.llvm::SymbolTableList" = type { %"class.llvm::iplist_impl" }
%"class.llvm::iplist_impl" = type { %"class.llvm::simple_ilist" }
%"class.llvm::simple_ilist" = type { %"class.llvm::ilist_sentinel" }
%"class.llvm::ilist_sentinel" = type { %"class.llvm::ilist_node_impl" }
%"class.llvm::ilist_node_impl" = type { %"class.llvm::ilist_node_base" }
%"class.llvm::ilist_node_base" = type { %"class.llvm::ilist_node_base"*, %"class.llvm::ilist_node_base"* }
%"class.llvm::SymbolTableList.2" = type { %"class.llvm::iplist_impl.3" }
%"class.llvm::iplist_impl.3" = type { %"class.llvm::simple_ilist.6" }
%"class.llvm::simple_ilist.6" = type { %"class.llvm::ilist_sentinel.8" }
%"class.llvm::ilist_sentinel.8" = type { %"class.llvm::ilist_node_impl.9" }
%"class.llvm::ilist_node_impl.9" = type { %"class.llvm::ilist_node_base" }
%"class.llvm::SymbolTableList.10" = type { %"class.llvm::iplist_impl.11" }
%"class.llvm::iplist_impl.11" = type { %"class.llvm::simple_ilist.14" }
%"class.llvm::simple_ilist.14" = type { %"class.llvm::ilist_sentinel.16" }
%"class.llvm::ilist_sentinel.16" = type { %"class.llvm::ilist_node_impl.17" }
%"class.llvm::ilist_node_impl.17" = type { %"class.llvm::ilist_node_base" }
%"class.llvm::SymbolTableList.18" = type { %"class.llvm::iplist_impl.19" }
%"class.llvm::iplist_impl.19" = type { %"class.llvm::simple_ilist.22" }
%"class.llvm::simple_ilist.22" = type { %"class.llvm::ilist_sentinel.24" }
%"class.llvm::ilist_sentinel.24" = type { %"class.llvm::ilist_node_impl.25" }
%"class.llvm::ilist_node_impl.25" = type { %"class.llvm::ilist_node_base" }
%"class.llvm::iplist" = type { %"class.llvm::iplist_impl.26" }
%"class.llvm::iplist_impl.26" = type { %"class.llvm::simple_ilist.28" }
%"class.llvm::simple_ilist.28" = type { %"class.llvm::ilist_sentinel.30" }
%"class.llvm::ilist_sentinel.30" = type { %"class.llvm::ilist_node_impl.31" }
%"class.llvm::ilist_node_impl.31" = type { %"class.llvm::ilist_node_base" }
%"class.llvm::ValueSymbolTable" = type opaque
%"class.llvm::StringMap" = type <{ %"class.llvm::StringMapImpl", %"class.llvm::MallocAllocator", [7 x i8] }>
%"class.llvm::StringMapImpl" = type { %"class.llvm::StringMapEntryBase"**, i32, i32, i32, i32 }
%"class.llvm::StringMapEntryBase" = type { i64 }
%"class.llvm::MallocAllocator" = type { i8 }
%"class.std::unique_ptr.36" = type { %"class.std::__uniq_ptr_impl.37" }
%"class.std::__uniq_ptr_impl.37" = type { %"class.std::tuple.38" }
%"class.std::tuple.38" = type { %"struct.std::_Tuple_impl.39" }
%"struct.std::_Tuple_impl.39" = type { %"struct.std::_Head_base.44" }
%"struct.std::_Head_base.44" = type { %"class.llvm::MemoryBuffer"* }
%"class.llvm::MemoryBuffer" = type { i32 (...)**, i8*, i8* }
%"class.std::unique_ptr.45" = type { %"class.std::__uniq_ptr_impl.46" }
%"class.std::__uniq_ptr_impl.46" = type { %"class.std::tuple.47" }
%"class.std::tuple.47" = type { %"struct.std::_Tuple_impl.48" }
%"struct.std::_Tuple_impl.48" = type { %"struct.std::_Head_base.53" }
%"struct.std::_Head_base.53" = type { %"class.llvm::GVMaterializer"* }
%"class.llvm::GVMaterializer" = type opaque
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon.35 }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon.35 = type { i64, [8 x i8] }
%"class.llvm::DataLayout" = type { i8, i32, i32, i32, i32, i32, i32, %"class.llvm::SmallVector", %"class.llvm::SmallVector.54", %"class.std::__cxx11::basic_string", %"class.llvm::SmallVector.61", i8*, %"class.llvm::SmallVector.68" }
%"class.llvm::SmallVector" = type { %"class.llvm::SmallVectorImpl", %"struct.llvm::SmallVectorStorage" }
%"class.llvm::SmallVectorImpl" = type { %"class.llvm::SmallVectorTemplateBase" }
%"class.llvm::SmallVectorTemplateBase" = type { %"class.llvm::SmallVectorTemplateCommon" }
%"class.llvm::SmallVectorTemplateCommon" = type { %"class.llvm::SmallVectorBase" }
%"class.llvm::SmallVectorBase" = type { i8*, i32, i32 }
%"struct.llvm::SmallVectorStorage" = type { [8 x %"struct.llvm::AlignedCharArrayUnion"] }
%"struct.llvm::AlignedCharArrayUnion" = type { %"struct.llvm::AlignedCharArray" }
%"struct.llvm::AlignedCharArray" = type { [1 x i8] }
%"class.llvm::SmallVector.54" = type { %"class.llvm::SmallVectorImpl.55", %"struct.llvm::SmallVectorStorage.58" }
%"class.llvm::SmallVectorImpl.55" = type { %"class.llvm::SmallVectorTemplateBase.56" }
%"class.llvm::SmallVectorTemplateBase.56" = type { %"class.llvm::SmallVectorTemplateCommon.57" }
%"class.llvm::SmallVectorTemplateCommon.57" = type { %"class.llvm::SmallVectorBase" }
%"struct.llvm::SmallVectorStorage.58" = type { [16 x %"struct.llvm::AlignedCharArrayUnion.59"] }
%"struct.llvm::AlignedCharArrayUnion.59" = type { %"struct.llvm::AlignedCharArray.60" }
%"struct.llvm::AlignedCharArray.60" = type { [8 x i8] }
%"class.llvm::SmallVector.61" = type { %"class.llvm::SmallVectorImpl.62", %"struct.llvm::SmallVectorStorage.65" }
%"class.llvm::SmallVectorImpl.62" = type { %"class.llvm::SmallVectorTemplateBase.63" }
%"class.llvm::SmallVectorTemplateBase.63" = type { %"class.llvm::SmallVectorTemplateCommon.64" }
%"class.llvm::SmallVectorTemplateCommon.64" = type { %"class.llvm::SmallVectorBase" }
%"struct.llvm::SmallVectorStorage.65" = type { [8 x %"struct.llvm::AlignedCharArrayUnion.66"] }
%"struct.llvm::AlignedCharArrayUnion.66" = type { %"struct.llvm::AlignedCharArray.67" }
%"struct.llvm::AlignedCharArray.67" = type { [20 x i8] }
%"class.llvm::SmallVector.68" = type { %"class.llvm::SmallVectorImpl.69", %"struct.llvm::SmallVectorStorage.72" }
%"class.llvm::SmallVectorImpl.69" = type { %"class.llvm::SmallVectorTemplateBase.70" }
%"class.llvm::SmallVectorTemplateBase.70" = type { %"class.llvm::SmallVectorTemplateCommon.71" }
%"class.llvm::SmallVectorTemplateCommon.71" = type { %"class.llvm::SmallVectorBase" }
%"struct.llvm::SmallVectorStorage.72" = type { [8 x %"struct.llvm::AlignedCharArrayUnion.73"] }
%"struct.llvm::AlignedCharArrayUnion.73" = type { %"struct.llvm::AlignedCharArray.74" }
%"struct.llvm::AlignedCharArray.74" = type { [4 x i8] }
%"class.llvm::LLVMContext" = type { %"class.llvm::LLVMContextImpl"* }
%"class.llvm::LLVMContextImpl" = type opaque
%"class.llvm::IRBuilder" = type opaque
%"class.std::map.75" = type { %"class.std::_Rb_tree.76" }
%"class.std::_Rb_tree.76" = type { %"struct.std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, llvm::AllocaInst *>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, llvm::AllocaInst *> >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, llvm::AllocaInst *> > >::_Rb_tree_impl" }
%"struct.std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, llvm::AllocaInst *>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, llvm::AllocaInst *> >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, llvm::AllocaInst *> > >::_Rb_tree_impl" = type { %"struct.std::_Rb_tree_key_compare", %"struct.std::_Rb_tree_header" }
%"class.std::unique_ptr.80" = type opaque
%"class.std::unique_ptr.81" = type opaque
%"class.std::map.82" = type opaque
%class.ProgramFile = type { %"class.std::vector", i8, %"class.std::vector.87" }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl" }
%"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl" = type { %"class.std::vector.86"*, %"class.std::vector.86"*, %"class.std::vector.86"* }
%"class.std::vector.86" = type { %"struct.std::_Vector_base.92" }
%"struct.std::_Vector_base.92" = type { %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl" }
%"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl" = type { i8*, i8*, i8* }
%"class.std::vector.87" = type { %"struct.std::_Vector_base.88" }
%"struct.std::_Vector_base.88" = type { %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl" }
%"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl" = type { %struct.Token*, %struct.Token*, %struct.Token* }
%struct.Token = type { %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string" }
%class.ASTTree = type { %class.ProgramFile, %struct.Token, i32, %class.CodeGenerator* }
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }
%"class.std::allocator.83" = type { i8 }
%"class.__gnu_cxx::__normal_iterator" = type { %"class.std::vector.86"* }
%"class.std::allocator.89" = type { i8 }
%"class.__gnu_cxx::__normal_iterator.94" = type { %struct.Token* }
%"class.__gnu_cxx::new_allocator.84" = type { i8 }
%"class.std::allocator.32" = type { i8 }
%"class.__gnu_cxx::__normal_iterator.93" = type { i8* }
%"class.__gnu_cxx::new_allocator.33" = type { i8 }
%"class.__gnu_cxx::new_allocator.90" = type { i8 }

$_ZN11ProgramFileC2ERKS_ = comdat any

$_ZN11ProgramFileD2Ev = comdat any

$_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_ = comdat any

$_ZN5TokenD2Ev = comdat any

$_ZN7ASTTreeD2Ev = comdat any

$_ZNSt6vectorIS_IcSaIcEESaIS1_EEC2ERKS3_ = comdat any

$_ZNSt6vectorI5TokenSaIS0_EEC2ERKS2_ = comdat any

$_ZNKSt6vectorIS_IcSaIcEESaIS1_EE4sizeEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIcSaIcEEEE17_S_select_on_copyERKS4_ = comdat any

$_ZNKSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EEC2EmRKS3_ = comdat any

$_ZNSaISt6vectorIcSaIcEEED2Ev = comdat any

$_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES2_IS4_SaIS4_EEEEPS4_S4_ET0_T_SC_SB_RSaIT1_E = comdat any

$_ZNKSt6vectorIS_IcSaIcEESaIS1_EE5beginEv = comdat any

$_ZNKSt6vectorIS_IcSaIcEESaIS1_EE3endEv = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE37select_on_container_copy_constructionERKS3_ = comdat any

$_ZNSaISt6vectorIcSaIcEEEC2ERKS2_ = comdat any

$_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEEC2ERKS4_ = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE12_Vector_implC2ERKS3_ = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE17_M_create_storageEm = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE11_M_allocateEm = comdat any

$_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE8allocateERS3_m = comdat any

$_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8allocateEmPKv = comdat any

$_ZNK9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8max_sizeEv = comdat any

$_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEED2Ev = comdat any

$_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES2_IS4_SaIS4_EEEEPS4_ET0_T_SC_SB_ = comdat any

$_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES4_IS6_SaIS6_EEEEPS6_EET0_T_SE_SD_ = comdat any

$_ZN9__gnu_cxxneIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEEbRKNS_17__normal_iteratorIT_T0_EESD_ = comdat any

$_ZSt10_ConstructISt6vectorIcSaIcEEJRKS2_EEvPT_DpOT0_ = comdat any

$_ZSt11__addressofISt6vectorIcSaIcEEEPT_RS3_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEdeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEppEv = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEE4baseEv = comdat any

$_ZSt7forwardIRKSt6vectorIcSaIcEEEOT_RNSt16remove_referenceIS5_E4typeE = comdat any

$_ZNSt6vectorIcSaIcEEC2ERKS1_ = comdat any

$_ZNKSt6vectorIcSaIcEE4sizeEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaIcEE17_S_select_on_copyERKS1_ = comdat any

$_ZNKSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseIcSaIcEEC2EmRKS0_ = comdat any

$_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPccET0_T_SA_S9_RSaIT1_E = comdat any

$_ZNKSt6vectorIcSaIcEE5beginEv = comdat any

$_ZNKSt6vectorIcSaIcEE3endEv = comdat any

$_ZNSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt16allocator_traitsISaIcEE37select_on_container_copy_constructionERKS0_ = comdat any

$_ZNSt12_Vector_baseIcSaIcEE12_Vector_implC2ERKS0_ = comdat any

$_ZNSt12_Vector_baseIcSaIcEE17_M_create_storageEm = comdat any

$_ZNSt12_Vector_baseIcSaIcEE11_M_allocateEm = comdat any

$_ZNSt16allocator_traitsISaIcEE8allocateERS0_m = comdat any

$_ZN9__gnu_cxx13new_allocatorIcE8allocateEmPKv = comdat any

$_ZNK9__gnu_cxx13new_allocatorIcE8max_sizeEv = comdat any

$_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET0_T_SA_S9_ = comdat any

$_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcEET0_T_SC_SB_ = comdat any

$_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET0_T_SA_S9_ = comdat any

$_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET1_T0_SA_S9_ = comdat any

$_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEET_S8_ = comdat any

$_ZSt13__copy_move_aILb0EPKcPcET1_T0_S4_S3_ = comdat any

$_ZSt12__niter_baseIPKcSt6vectorIcSaIcEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE = comdat any

$_ZSt12__niter_baseIPcET_S1_ = comdat any

$_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIcEEPT_PKS3_S6_S4_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEE4baseEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEC2ERKS2_ = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEC2ERKS5_ = comdat any

$_ZNKSt6vectorI5TokenSaIS0_EE4sizeEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI5TokenEE17_S_select_on_copyERKS2_ = comdat any

$_ZNKSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EEC2EmRKS1_ = comdat any

$_ZNSaI5TokenED2Ev = comdat any

$_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS2_SaIS2_EEEEPS2_S2_ET0_T_SB_SA_RSaIT1_E = comdat any

$_ZNKSt6vectorI5TokenSaIS0_EE5beginEv = comdat any

$_ZNKSt6vectorI5TokenSaIS0_EE3endEv = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt16allocator_traitsISaI5TokenEE37select_on_container_copy_constructionERKS1_ = comdat any

$_ZNSaI5TokenEC2ERKS0_ = comdat any

$_ZN9__gnu_cxx13new_allocatorI5TokenEC2ERKS2_ = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EE12_Vector_implC2ERKS1_ = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EE17_M_create_storageEm = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EE11_M_allocateEm = comdat any

$_ZNSt16allocator_traitsISaI5TokenEE8allocateERS1_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI5TokenE8allocateEmPKv = comdat any

$_ZNK9__gnu_cxx13new_allocatorI5TokenE8max_sizeEv = comdat any

$_ZN9__gnu_cxx13new_allocatorI5TokenED2Ev = comdat any

$_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS2_SaIS2_EEEEPS2_ET0_T_SB_SA_ = comdat any

$_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS4_SaIS4_EEEEPS4_EET0_T_SD_SC_ = comdat any

$_ZN9__gnu_cxxneIPK5TokenSt6vectorIS1_SaIS1_EEEEbRKNS_17__normal_iteratorIT_T0_EESC_ = comdat any

$_ZSt10_ConstructI5TokenJRKS0_EEvPT_DpOT0_ = comdat any

$_ZSt11__addressofI5TokenEPT_RS1_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEdeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEppEv = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEE4baseEv = comdat any

$_ZSt7forwardIRK5TokenEOT_RNSt16remove_referenceIS3_E4typeE = comdat any

$_ZN5TokenC2ERKS_ = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEC2ERKS3_ = comdat any

$_ZNSt6vectorI5TokenSaIS0_EED2Ev = comdat any

$_ZNSt6vectorIS_IcSaIcEESaIS1_EED2Ev = comdat any

$_ZSt8_DestroyIP5TokenS0_EvT_S2_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EED2Ev = comdat any

$_ZSt8_DestroyIP5TokenEvT_S2_ = comdat any

$_ZNSt12_Destroy_auxILb0EE9__destroyIP5TokenEEvT_S4_ = comdat any

$_ZSt8_DestroyI5TokenEvPT_ = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EE13_M_deallocateEPS0_m = comdat any

$_ZNSt12_Vector_baseI5TokenSaIS0_EE12_Vector_implD2Ev = comdat any

$_ZNSt16allocator_traitsISaI5TokenEE10deallocateERS1_PS0_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI5TokenE10deallocateEPS1_m = comdat any

$_ZSt8_DestroyIPSt6vectorIcSaIcEES2_EvT_S4_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EED2Ev = comdat any

$_ZSt8_DestroyIPSt6vectorIcSaIcEEEvT_S4_ = comdat any

$_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIcSaIcEEEEvT_S6_ = comdat any

$_ZSt8_DestroyISt6vectorIcSaIcEEEvPT_ = comdat any

$_ZNSt6vectorIcSaIcEED2Ev = comdat any

$_ZSt8_DestroyIPccEvT_S1_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseIcSaIcEED2Ev = comdat any

$_ZSt8_DestroyIPcEvT_S1_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIPcEEvT_S3_ = comdat any

$_ZNSt12_Vector_baseIcSaIcEE13_M_deallocateEPcm = comdat any

$_ZNSt12_Vector_baseIcSaIcEE12_Vector_implD2Ev = comdat any

$_ZNSt16allocator_traitsISaIcEE10deallocateERS0_Pcm = comdat any

$_ZN9__gnu_cxx13new_allocatorIcE10deallocateEPcm = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE13_M_deallocateEPS2_m = comdat any

$_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE12_Vector_implD2Ev = comdat any

$_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE10deallocateERS3_PS2_m = comdat any

$_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE10deallocateEPS3_m = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZN4llvm24DisableABIBreakingChecksE = external global i32, align 4
@_ZN4llvm30VerifyDisableABIBreakingChecksE = weak hidden global i32* @_ZN4llvm24DisableABIBreakingChecksE, align 8
@.str = private unnamed_addr constant [9 x i8] c"test.isd\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"EOF\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"semicolon\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"data_void\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_test_lexer.cpp, i8* null }]

; Function Attrs: noinline nounwind uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline norecurse nounwind optnone uwtable
define i32 @main() #4 {
  %1 = alloca i32, align 4
  %2 = alloca %"class.std::basic_ifstream", align 8
  %3 = alloca %class.CodeGenerator*, align 8
  %4 = alloca %class.ProgramFile, align 8
  %5 = alloca i32, align 4
  %6 = alloca %class.ASTTree, align 8
  %7 = alloca %class.ProgramFile, align 8
  %8 = alloca %struct.Token, align 8
  %9 = alloca %struct.Token, align 8
  %10 = alloca %struct.Token, align 8
  %11 = alloca %struct.Token, align 8
  %12 = alloca %struct.Token, align 8
  store i32 0, i32* %1, align 4
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 8)
  %13 = call i8* @_Znwm(i64 144) #10
  %14 = bitcast i8* %13 to %class.CodeGenerator*
  call void @_ZN13CodeGeneratorC1Ev(%class.CodeGenerator* %14)
  store %class.CodeGenerator* %14, %class.CodeGenerator** %3, align 8
  %15 = bitcast %"class.std::basic_ifstream"* %2 to %"class.std::basic_istream"*
  call void @_ZN11ProgramFileC1ERSi(%class.ProgramFile* %4, %"class.std::basic_istream"* dereferenceable(280) %15)
  call void @_Z13tokenize_fileR11ProgramFile(%class.ProgramFile* dereferenceable(56) %4)
  store i32 0, i32* %5, align 4
  call void @_ZN11ProgramFileC2ERKS_(%class.ProgramFile* %7, %class.ProgramFile* dereferenceable(56) %4)
  %16 = load %class.CodeGenerator*, %class.CodeGenerator** %3, align 8
  call void @_ZN7ASTTreeC1E11ProgramFileP13CodeGenerator(%class.ASTTree* %6, %class.ProgramFile* %7, %class.CodeGenerator* %16)
  call void @_ZN11ProgramFileD2Ev(%class.ProgramFile* %7) #3
  br label %17

; <label>:17:                                     ; preds = %42, %0
  br label %18

; <label>:18:                                     ; preds = %17
  call void @_ZN7ASTTree12getCurrTokenEv(%struct.Token* sret %8, %class.ASTTree* %6)
  %19 = getelementptr inbounds %struct.Token, %struct.Token* %8, i32 0, i32 1
  %20 = call zeroext i1 @_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_(%"class.std::__cxx11::basic_string"* dereferenceable(32) %19, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  call void @_ZN5TokenD2Ev(%struct.Token* %8) #3
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  store i32 1, i32* %1, align 4
  call void @_ZN7ASTTreeD2Ev(%class.ASTTree* %6) #3
  call void @_ZN11ProgramFileD2Ev(%class.ProgramFile* %4) #3
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %2) #3
  %22 = load i32, i32* %1, align 4
  ret i32 %22

; <label>:23:                                     ; preds = %18
  call void @_ZN7ASTTree12getCurrTokenEv(%struct.Token* sret %9, %class.ASTTree* %6)
  %24 = getelementptr inbounds %struct.Token, %struct.Token* %9, i32 0, i32 0
  %25 = call zeroext i1 @_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_(%"class.std::__cxx11::basic_string"* dereferenceable(32) %24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0))
  call void @_ZN5TokenD2Ev(%struct.Token* %9) #3
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %23
  call void @_ZN7ASTTree9nextTokenEv(%struct.Token* sret %10, %class.ASTTree* %6)
  call void @_ZN5TokenD2Ev(%struct.Token* %10) #3
  br label %41

; <label>:27:                                     ; preds = %23
  call void @_ZN7ASTTree12getCurrTokenEv(%struct.Token* sret %11, %class.ASTTree* %6)
  %28 = getelementptr inbounds %struct.Token, %struct.Token* %11, i32 0, i32 0
  %29 = call zeroext i1 @_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_(%"class.std::__cxx11::basic_string"* dereferenceable(32) %28, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0))
  call void @_ZN5TokenD2Ev(%struct.Token* %11) #3
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %27
  %31 = load %class.CodeGenerator*, %class.CodeGenerator** %3, align 8
  call void @_Z16HandleDefinitionR7ASTTreeP13CodeGenerator(%class.ASTTree* dereferenceable(136) %6, %class.CodeGenerator* %31)
  br label %40

; <label>:32:                                     ; preds = %27
  call void @_ZN7ASTTree12getCurrTokenEv(%struct.Token* sret %12, %class.ASTTree* %6)
  %33 = getelementptr inbounds %struct.Token, %struct.Token* %12, i32 0, i32 0
  %34 = call zeroext i1 @_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_(%"class.std::__cxx11::basic_string"* dereferenceable(32) %33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0))
  call void @_ZN5TokenD2Ev(%struct.Token* %12) #3
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %32
  %36 = load %class.CodeGenerator*, %class.CodeGenerator** %3, align 8
  call void @_Z12HandleExternR7ASTTreeP13CodeGenerator(%class.ASTTree* dereferenceable(136) %6, %class.CodeGenerator* %36)
  br label %39

; <label>:37:                                     ; preds = %32
  %38 = load %class.CodeGenerator*, %class.CodeGenerator** %3, align 8
  call void @_Z24HandleTopLevelExpressionR7ASTTreeP13CodeGenerator(%class.ASTTree* dereferenceable(136) %6, %class.CodeGenerator* %38)
  br label %39

; <label>:39:                                     ; preds = %37, %35
  br label %40

; <label>:40:                                     ; preds = %39, %30
  br label %41

; <label>:41:                                     ; preds = %40, %26
  br label %42

; <label>:42:                                     ; preds = %41
  br label %17
}

declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"*, i8*, i32) unnamed_addr #1

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #5

declare void @_ZN13CodeGeneratorC1Ev(%class.CodeGenerator*) unnamed_addr #1

declare void @_ZN11ProgramFileC1ERSi(%class.ProgramFile*, %"class.std::basic_istream"* dereferenceable(280)) unnamed_addr #1

declare void @_Z13tokenize_fileR11ProgramFile(%class.ProgramFile* dereferenceable(56)) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN11ProgramFileC2ERKS_(%class.ProgramFile*, %class.ProgramFile* dereferenceable(56)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %class.ProgramFile*, align 8
  %4 = alloca %class.ProgramFile*, align 8
  store %class.ProgramFile* %0, %class.ProgramFile** %3, align 8
  store %class.ProgramFile* %1, %class.ProgramFile** %4, align 8
  %5 = load %class.ProgramFile*, %class.ProgramFile** %3, align 8
  %6 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %5, i32 0, i32 0
  %7 = load %class.ProgramFile*, %class.ProgramFile** %4, align 8
  %8 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %7, i32 0, i32 0
  call void @_ZNSt6vectorIS_IcSaIcEESaIS1_EEC2ERKS3_(%"class.std::vector"* %6, %"class.std::vector"* dereferenceable(24) %8)
  %9 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %5, i32 0, i32 1
  %10 = load %class.ProgramFile*, %class.ProgramFile** %4, align 8
  %11 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %10, i32 0, i32 1
  %12 = load i8, i8* %11, align 8
  %13 = trunc i8 %12 to i1
  %14 = zext i1 %13 to i8
  store i8 %14, i8* %9, align 8
  %15 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %5, i32 0, i32 2
  %16 = load %class.ProgramFile*, %class.ProgramFile** %4, align 8
  %17 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %16, i32 0, i32 2
  call void @_ZNSt6vectorI5TokenSaIS0_EEC2ERKS2_(%"class.std::vector.87"* %15, %"class.std::vector.87"* dereferenceable(24) %17)
  ret void
}

declare void @_ZN7ASTTreeC1E11ProgramFileP13CodeGenerator(%class.ASTTree*, %class.ProgramFile*, %class.CodeGenerator*) unnamed_addr #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN11ProgramFileD2Ev(%class.ProgramFile*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %class.ProgramFile*, align 8
  store %class.ProgramFile* %0, %class.ProgramFile** %2, align 8
  %3 = load %class.ProgramFile*, %class.ProgramFile** %2, align 8
  %4 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %3, i32 0, i32 2
  call void @_ZNSt6vectorI5TokenSaIS0_EED2Ev(%"class.std::vector.87"* %4) #3
  %5 = getelementptr inbounds %class.ProgramFile, %class.ProgramFile* %3, i32 0, i32 0
  call void @_ZNSt6vectorIS_IcSaIcEESaIS1_EED2Ev(%"class.std::vector"* %5) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr zeroext i1 @_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_(%"class.std::__cxx11::basic_string"* dereferenceable(32), i8*) #6 comdat {
  %3 = alloca %"class.std::__cxx11::basic_string"*, align 8
  %4 = alloca i8*, align 8
  store %"class.std::__cxx11::basic_string"* %0, %"class.std::__cxx11::basic_string"** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %3, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = call i32 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc(%"class.std::__cxx11::basic_string"* %5, i8* %6) #3
  %8 = icmp eq i32 %7, 0
  ret i1 %8
}

declare void @_ZN7ASTTree12getCurrTokenEv(%struct.Token* sret, %class.ASTTree*) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN5TokenD2Ev(%struct.Token*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %2, align 8
  %3 = load %struct.Token*, %struct.Token** %2, align 8
  %4 = getelementptr inbounds %struct.Token, %struct.Token* %3, i32 0, i32 1
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %4) #3
  %5 = getelementptr inbounds %struct.Token, %struct.Token* %3, i32 0, i32 0
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %5) #3
  ret void
}

declare void @_ZN7ASTTree9nextTokenEv(%struct.Token* sret, %class.ASTTree*) #1

declare void @_Z16HandleDefinitionR7ASTTreeP13CodeGenerator(%class.ASTTree* dereferenceable(136), %class.CodeGenerator*) #1

declare void @_Z12HandleExternR7ASTTreeP13CodeGenerator(%class.ASTTree* dereferenceable(136), %class.CodeGenerator*) #1

declare void @_Z24HandleTopLevelExpressionR7ASTTreeP13CodeGenerator(%class.ASTTree* dereferenceable(136), %class.CodeGenerator*) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN7ASTTreeD2Ev(%class.ASTTree*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %class.ASTTree*, align 8
  store %class.ASTTree* %0, %class.ASTTree** %2, align 8
  %3 = load %class.ASTTree*, %class.ASTTree** %2, align 8
  %4 = getelementptr inbounds %class.ASTTree, %class.ASTTree* %3, i32 0, i32 1
  call void @_ZN5TokenD2Ev(%struct.Token* %4) #3
  %5 = getelementptr inbounds %class.ASTTree, %class.ASTTree* %3, i32 0, i32 0
  call void @_ZN11ProgramFileD2Ev(%class.ProgramFile* %5) #3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"*) unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt6vectorIS_IcSaIcEESaIS1_EEC2ERKS3_(%"class.std::vector"*, %"class.std::vector"* dereferenceable(24)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca %"class.std::vector"*, align 8
  %5 = alloca %"class.std::allocator.83", align 1
  %6 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  store %"class.std::vector"* %1, %"class.std::vector"** %4, align 8
  %8 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %9 = bitcast %"class.std::vector"* %8 to %"struct.std::_Vector_base"*
  %10 = load %"class.std::vector"*, %"class.std::vector"** %4, align 8
  %11 = call i64 @_ZNKSt6vectorIS_IcSaIcEESaIS1_EE4sizeEv(%"class.std::vector"* %10) #3
  %12 = load %"class.std::vector"*, %"class.std::vector"** %4, align 8
  %13 = bitcast %"class.std::vector"* %12 to %"struct.std::_Vector_base"*
  %14 = call dereferenceable(1) %"class.std::allocator.83"* @_ZNKSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %13) #3
  call void @_ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIcSaIcEEEE17_S_select_on_copyERKS4_(%"class.std::allocator.83"* sret %5, %"class.std::allocator.83"* dereferenceable(1) %14)
  call void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EEC2EmRKS3_(%"struct.std::_Vector_base"* %9, i64 %11, %"class.std::allocator.83"* dereferenceable(1) %5)
  call void @_ZNSaISt6vectorIcSaIcEEED2Ev(%"class.std::allocator.83"* %5) #3
  %15 = load %"class.std::vector"*, %"class.std::vector"** %4, align 8
  %16 = call %"class.std::vector.86"* @_ZNKSt6vectorIS_IcSaIcEESaIS1_EE5beginEv(%"class.std::vector"* %15) #3
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %6, i32 0, i32 0
  store %"class.std::vector.86"* %16, %"class.std::vector.86"** %17, align 8
  %18 = load %"class.std::vector"*, %"class.std::vector"** %4, align 8
  %19 = call %"class.std::vector.86"* @_ZNKSt6vectorIS_IcSaIcEESaIS1_EE3endEv(%"class.std::vector"* %18) #3
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %7, i32 0, i32 0
  store %"class.std::vector.86"* %19, %"class.std::vector.86"** %20, align 8
  %21 = bitcast %"class.std::vector"* %8 to %"struct.std::_Vector_base"*
  %22 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %21, i32 0, i32 0
  %23 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %22, i32 0, i32 0
  %24 = load %"class.std::vector.86"*, %"class.std::vector.86"** %23, align 8
  %25 = bitcast %"class.std::vector"* %8 to %"struct.std::_Vector_base"*
  %26 = call dereferenceable(1) %"class.std::allocator.83"* @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %25) #3
  %27 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %6, i32 0, i32 0
  %28 = load %"class.std::vector.86"*, %"class.std::vector.86"** %27, align 8
  %29 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %7, i32 0, i32 0
  %30 = load %"class.std::vector.86"*, %"class.std::vector.86"** %29, align 8
  %31 = call %"class.std::vector.86"* @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES2_IS4_SaIS4_EEEEPS4_S4_ET0_T_SC_SB_RSaIT1_E(%"class.std::vector.86"* %28, %"class.std::vector.86"* %30, %"class.std::vector.86"* %24, %"class.std::allocator.83"* dereferenceable(1) %26)
  %32 = bitcast %"class.std::vector"* %8 to %"struct.std::_Vector_base"*
  %33 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %32, i32 0, i32 0
  %34 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %33, i32 0, i32 1
  store %"class.std::vector.86"* %31, %"class.std::vector.86"** %34, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt6vectorI5TokenSaIS0_EEC2ERKS2_(%"class.std::vector.87"*, %"class.std::vector.87"* dereferenceable(24)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.std::vector.87"*, align 8
  %4 = alloca %"class.std::vector.87"*, align 8
  %5 = alloca %"class.std::allocator.89", align 1
  %6 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  store %"class.std::vector.87"* %0, %"class.std::vector.87"** %3, align 8
  store %"class.std::vector.87"* %1, %"class.std::vector.87"** %4, align 8
  %8 = load %"class.std::vector.87"*, %"class.std::vector.87"** %3, align 8
  %9 = bitcast %"class.std::vector.87"* %8 to %"struct.std::_Vector_base.88"*
  %10 = load %"class.std::vector.87"*, %"class.std::vector.87"** %4, align 8
  %11 = call i64 @_ZNKSt6vectorI5TokenSaIS0_EE4sizeEv(%"class.std::vector.87"* %10) #3
  %12 = load %"class.std::vector.87"*, %"class.std::vector.87"** %4, align 8
  %13 = bitcast %"class.std::vector.87"* %12 to %"struct.std::_Vector_base.88"*
  %14 = call dereferenceable(1) %"class.std::allocator.89"* @_ZNKSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.88"* %13) #3
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI5TokenEE17_S_select_on_copyERKS2_(%"class.std::allocator.89"* sret %5, %"class.std::allocator.89"* dereferenceable(1) %14)
  call void @_ZNSt12_Vector_baseI5TokenSaIS0_EEC2EmRKS1_(%"struct.std::_Vector_base.88"* %9, i64 %11, %"class.std::allocator.89"* dereferenceable(1) %5)
  call void @_ZNSaI5TokenED2Ev(%"class.std::allocator.89"* %5) #3
  %15 = load %"class.std::vector.87"*, %"class.std::vector.87"** %4, align 8
  %16 = call %struct.Token* @_ZNKSt6vectorI5TokenSaIS0_EE5beginEv(%"class.std::vector.87"* %15) #3
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %6, i32 0, i32 0
  store %struct.Token* %16, %struct.Token** %17, align 8
  %18 = load %"class.std::vector.87"*, %"class.std::vector.87"** %4, align 8
  %19 = call %struct.Token* @_ZNKSt6vectorI5TokenSaIS0_EE3endEv(%"class.std::vector.87"* %18) #3
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %7, i32 0, i32 0
  store %struct.Token* %19, %struct.Token** %20, align 8
  %21 = bitcast %"class.std::vector.87"* %8 to %"struct.std::_Vector_base.88"*
  %22 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %21, i32 0, i32 0
  %23 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %22, i32 0, i32 0
  %24 = load %struct.Token*, %struct.Token** %23, align 8
  %25 = bitcast %"class.std::vector.87"* %8 to %"struct.std::_Vector_base.88"*
  %26 = call dereferenceable(1) %"class.std::allocator.89"* @_ZNSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.88"* %25) #3
  %27 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %6, i32 0, i32 0
  %28 = load %struct.Token*, %struct.Token** %27, align 8
  %29 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %7, i32 0, i32 0
  %30 = load %struct.Token*, %struct.Token** %29, align 8
  %31 = call %struct.Token* @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS2_SaIS2_EEEEPS2_S2_ET0_T_SB_SA_RSaIT1_E(%struct.Token* %28, %struct.Token* %30, %struct.Token* %24, %"class.std::allocator.89"* dereferenceable(1) %26)
  %32 = bitcast %"class.std::vector.87"* %8 to %"struct.std::_Vector_base.88"*
  %33 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %32, i32 0, i32 0
  %34 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %33, i32 0, i32 1
  store %struct.Token* %31, %struct.Token** %34, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i64 @_ZNKSt6vectorIS_IcSaIcEESaIS1_EE4sizeEv(%"class.std::vector"*) #6 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %3 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %4 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %5, i32 0, i32 1
  %7 = load %"class.std::vector.86"*, %"class.std::vector.86"** %6, align 8
  %8 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %8, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %9, i32 0, i32 0
  %11 = load %"class.std::vector.86"*, %"class.std::vector.86"** %10, align 8
  %12 = ptrtoint %"class.std::vector.86"* %7 to i64
  %13 = ptrtoint %"class.std::vector.86"* %11 to i64
  %14 = sub i64 %12, %13
  %15 = sdiv exact i64 %14, 24
  ret i64 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaISt6vectorIcSaIcEEEE17_S_select_on_copyERKS4_(%"class.std::allocator.83"* noalias sret, %"class.std::allocator.83"* dereferenceable(1)) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.83"*, align 8
  store %"class.std::allocator.83"* %1, %"class.std::allocator.83"** %3, align 8
  %4 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %3, align 8
  call void @_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE37select_on_container_copy_constructionERKS3_(%"class.std::allocator.83"* sret %0, %"class.std::allocator.83"* dereferenceable(1) %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.83"* @_ZNKSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"*) #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %4 to %"class.std::allocator.83"*
  ret %"class.std::allocator.83"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EEC2EmRKS3_(%"struct.std::_Vector_base"*, i64, %"class.std::allocator.83"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %"class.std::allocator.83"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %4, align 8
  store i64 %1, i64* %5, align 8
  store %"class.std::allocator.83"* %2, %"class.std::allocator.83"** %6, align 8
  %7 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %4, align 8
  %8 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %9 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %6, align 8
  call void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE12_Vector_implC2ERKS3_(%"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %8, %"class.std::allocator.83"* dereferenceable(1) %9) #3
  %10 = load i64, i64* %5, align 8
  call void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE17_M_create_storageEm(%"struct.std::_Vector_base"* %7, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSaISt6vectorIcSaIcEEED2Ev(%"class.std::allocator.83"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.std::allocator.83"*, align 8
  store %"class.std::allocator.83"* %0, %"class.std::allocator.83"** %2, align 8
  %3 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %2, align 8
  %4 = bitcast %"class.std::allocator.83"* %3 to %"class.__gnu_cxx::new_allocator.84"*
  call void @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEED2Ev(%"class.__gnu_cxx::new_allocator.84"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES2_IS4_SaIS4_EEEEPS4_S4_ET0_T_SC_SB_RSaIT1_E(%"class.std::vector.86"*, %"class.std::vector.86"*, %"class.std::vector.86"*, %"class.std::allocator.83"* dereferenceable(1)) #6 comdat {
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %7 = alloca %"class.std::vector.86"*, align 8
  %8 = alloca %"class.std::allocator.83"*, align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %10 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %11, align 8
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %6, i32 0, i32 0
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %12, align 8
  store %"class.std::vector.86"* %2, %"class.std::vector.86"** %7, align 8
  store %"class.std::allocator.83"* %3, %"class.std::allocator.83"** %8, align 8
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator"* %9 to i8*
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 8, i32 8, i1 false)
  %15 = bitcast %"class.__gnu_cxx::__normal_iterator"* %10 to i8*
  %16 = bitcast %"class.__gnu_cxx::__normal_iterator"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 8, i32 8, i1 false)
  %17 = load %"class.std::vector.86"*, %"class.std::vector.86"** %7, align 8
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %9, i32 0, i32 0
  %19 = load %"class.std::vector.86"*, %"class.std::vector.86"** %18, align 8
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %10, i32 0, i32 0
  %21 = load %"class.std::vector.86"*, %"class.std::vector.86"** %20, align 8
  %22 = call %"class.std::vector.86"* @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES2_IS4_SaIS4_EEEEPS4_ET0_T_SC_SB_(%"class.std::vector.86"* %19, %"class.std::vector.86"* %21, %"class.std::vector.86"* %17)
  ret %"class.std::vector.86"* %22
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZNKSt6vectorIS_IcSaIcEESaIS1_EE5beginEv(%"class.std::vector"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %6 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %7, i32 0, i32 0
  %9 = load %"class.std::vector.86"*, %"class.std::vector.86"** %8, align 8
  store %"class.std::vector.86"* %9, %"class.std::vector.86"** %4, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEC2ERKS5_(%"class.__gnu_cxx::__normal_iterator"* %2, %"class.std::vector.86"** dereferenceable(8) %4) #3
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %2, i32 0, i32 0
  %11 = load %"class.std::vector.86"*, %"class.std::vector.86"** %10, align 8
  ret %"class.std::vector.86"* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZNKSt6vectorIS_IcSaIcEESaIS1_EE3endEv(%"class.std::vector"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca %"class.std::vector"*, align 8
  %4 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %3, align 8
  %5 = load %"class.std::vector"*, %"class.std::vector"** %3, align 8
  %6 = bitcast %"class.std::vector"* %5 to %"struct.std::_Vector_base"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %7, i32 0, i32 1
  %9 = load %"class.std::vector.86"*, %"class.std::vector.86"** %8, align 8
  store %"class.std::vector.86"* %9, %"class.std::vector.86"** %4, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEC2ERKS5_(%"class.__gnu_cxx::__normal_iterator"* %2, %"class.std::vector.86"** dereferenceable(8) %4) #3
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %2, i32 0, i32 0
  %11 = load %"class.std::vector.86"*, %"class.std::vector.86"** %10, align 8
  ret %"class.std::vector.86"* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.83"* @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"*) #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %4 to %"class.std::allocator.83"*
  ret %"class.std::allocator.83"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE37select_on_container_copy_constructionERKS3_(%"class.std::allocator.83"* noalias sret, %"class.std::allocator.83"* dereferenceable(1)) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.83"*, align 8
  store %"class.std::allocator.83"* %1, %"class.std::allocator.83"** %3, align 8
  %4 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %3, align 8
  call void @_ZNSaISt6vectorIcSaIcEEEC2ERKS2_(%"class.std::allocator.83"* %0, %"class.std::allocator.83"* dereferenceable(1) %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSaISt6vectorIcSaIcEEEC2ERKS2_(%"class.std::allocator.83"*, %"class.std::allocator.83"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.83"*, align 8
  %4 = alloca %"class.std::allocator.83"*, align 8
  store %"class.std::allocator.83"* %0, %"class.std::allocator.83"** %3, align 8
  store %"class.std::allocator.83"* %1, %"class.std::allocator.83"** %4, align 8
  %5 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %3, align 8
  %6 = bitcast %"class.std::allocator.83"* %5 to %"class.__gnu_cxx::new_allocator.84"*
  %7 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %4, align 8
  %8 = bitcast %"class.std::allocator.83"* %7 to %"class.__gnu_cxx::new_allocator.84"*
  call void @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEEC2ERKS4_(%"class.__gnu_cxx::new_allocator.84"* %6, %"class.__gnu_cxx::new_allocator.84"* dereferenceable(1) %8) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEEC2ERKS4_(%"class.__gnu_cxx::new_allocator.84"*, %"class.__gnu_cxx::new_allocator.84"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::new_allocator.84"*, align 8
  %4 = alloca %"class.__gnu_cxx::new_allocator.84"*, align 8
  store %"class.__gnu_cxx::new_allocator.84"* %0, %"class.__gnu_cxx::new_allocator.84"** %3, align 8
  store %"class.__gnu_cxx::new_allocator.84"* %1, %"class.__gnu_cxx::new_allocator.84"** %4, align 8
  %5 = load %"class.__gnu_cxx::new_allocator.84"*, %"class.__gnu_cxx::new_allocator.84"** %3, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE12_Vector_implC2ERKS3_(%"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"*, %"class.std::allocator.83"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"*, align 8
  %4 = alloca %"class.std::allocator.83"*, align 8
  store %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %0, %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"** %3, align 8
  store %"class.std::allocator.83"* %1, %"class.std::allocator.83"** %4, align 8
  %5 = load %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"*, %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"** %3, align 8
  %6 = bitcast %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %5 to %"class.std::allocator.83"*
  %7 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %4, align 8
  call void @_ZNSaISt6vectorIcSaIcEEEC2ERKS2_(%"class.std::allocator.83"* %6, %"class.std::allocator.83"* dereferenceable(1) %7) #3
  %8 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %5, i32 0, i32 0
  store %"class.std::vector.86"* null, %"class.std::vector.86"** %8, align 8
  %9 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %5, i32 0, i32 1
  store %"class.std::vector.86"* null, %"class.std::vector.86"** %9, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %5, i32 0, i32 2
  store %"class.std::vector.86"* null, %"class.std::vector.86"** %10, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE17_M_create_storageEm(%"struct.std::_Vector_base"*, i64) #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call %"class.std::vector.86"* @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE11_M_allocateEm(%"struct.std::_Vector_base"* %5, i64 %6)
  %8 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %9 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %8, i32 0, i32 0
  store %"class.std::vector.86"* %7, %"class.std::vector.86"** %9, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %10, i32 0, i32 0
  %12 = load %"class.std::vector.86"*, %"class.std::vector.86"** %11, align 8
  %13 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %14 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %13, i32 0, i32 1
  store %"class.std::vector.86"* %12, %"class.std::vector.86"** %14, align 8
  %15 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %16 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %15, i32 0, i32 0
  %17 = load %"class.std::vector.86"*, %"class.std::vector.86"** %16, align 8
  %18 = load i64, i64* %4, align 8
  %19 = getelementptr inbounds %"class.std::vector.86", %"class.std::vector.86"* %17, i64 %18
  %20 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %21 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %20, i32 0, i32 2
  store %"class.std::vector.86"* %19, %"class.std::vector.86"** %21, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE11_M_allocateEm(%"struct.std::_Vector_base"*, i64) #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %5, i32 0, i32 0
  %10 = bitcast %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %9 to %"class.std::allocator.83"*
  %11 = load i64, i64* %4, align 8
  %12 = call %"class.std::vector.86"* @_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE8allocateERS3_m(%"class.std::allocator.83"* dereferenceable(1) %10, i64 %11)
  br label %14

; <label>:13:                                     ; preds = %2
  br label %14

; <label>:14:                                     ; preds = %13, %8
  %15 = phi %"class.std::vector.86"* [ %12, %8 ], [ null, %13 ]
  ret %"class.std::vector.86"* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE8allocateERS3_m(%"class.std::allocator.83"* dereferenceable(1), i64) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.83"*, align 8
  %4 = alloca i64, align 8
  store %"class.std::allocator.83"* %0, %"class.std::allocator.83"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %3, align 8
  %6 = bitcast %"class.std::allocator.83"* %5 to %"class.__gnu_cxx::new_allocator.84"*
  %7 = load i64, i64* %4, align 8
  %8 = call %"class.std::vector.86"* @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.84"* %6, i64 %7, i8* null)
  ret %"class.std::vector.86"* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.84"*, i64, i8*) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator.84"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator.84"* %0, %"class.__gnu_cxx::new_allocator.84"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator.84"*, %"class.__gnu_cxx::new_allocator.84"** %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = call i64 @_ZNK9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8max_sizeEv(%"class.__gnu_cxx::new_allocator.84"* %7) #3
  %10 = icmp ugt i64 %8, %9
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  call void @_ZSt17__throw_bad_allocv() #11
  unreachable

; <label>:12:                                     ; preds = %3
  %13 = load i64, i64* %5, align 8
  %14 = mul i64 %13, 24
  %15 = call i8* @_Znwm(i64 %14)
  %16 = bitcast i8* %15 to %"class.std::vector.86"*
  ret %"class.std::vector.86"* %16
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i64 @_ZNK9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8max_sizeEv(%"class.__gnu_cxx::new_allocator.84"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator.84"*, align 8
  store %"class.__gnu_cxx::new_allocator.84"* %0, %"class.__gnu_cxx::new_allocator.84"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator.84"*, %"class.__gnu_cxx::new_allocator.84"** %2, align 8
  ret i64 768614336404564650
}

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() #7

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEED2Ev(%"class.__gnu_cxx::new_allocator.84"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator.84"*, align 8
  store %"class.__gnu_cxx::new_allocator.84"* %0, %"class.__gnu_cxx::new_allocator.84"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator.84"*, %"class.__gnu_cxx::new_allocator.84"** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES2_IS4_SaIS4_EEEEPS4_ET0_T_SC_SB_(%"class.std::vector.86"*, %"class.std::vector.86"*, %"class.std::vector.86"*) #6 comdat {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca %"class.std::vector.86"*, align 8
  %7 = alloca i8, align 1
  %8 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %4, i32 0, i32 0
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %10, align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %11, align 8
  store %"class.std::vector.86"* %2, %"class.std::vector.86"** %6, align 8
  store i8 1, i8* %7, align 1
  %12 = bitcast %"class.__gnu_cxx::__normal_iterator"* %8 to i8*
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 8, i32 8, i1 false)
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator"* %9 to i8*
  %15 = bitcast %"class.__gnu_cxx::__normal_iterator"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 8, i1 false)
  %16 = load %"class.std::vector.86"*, %"class.std::vector.86"** %6, align 8
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %8, i32 0, i32 0
  %18 = load %"class.std::vector.86"*, %"class.std::vector.86"** %17, align 8
  %19 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %9, i32 0, i32 0
  %20 = load %"class.std::vector.86"*, %"class.std::vector.86"** %19, align 8
  %21 = call %"class.std::vector.86"* @_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES4_IS6_SaIS6_EEEEPS6_EET0_T_SE_SD_(%"class.std::vector.86"* %18, %"class.std::vector.86"* %20, %"class.std::vector.86"* %16)
  ret %"class.std::vector.86"* %21
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #8

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES4_IS6_SaIS6_EEEEPS6_EET0_T_SE_SD_(%"class.std::vector.86"*, %"class.std::vector.86"*, %"class.std::vector.86"*) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca %"class.std::vector.86"*, align 8
  %7 = alloca %"class.std::vector.86"*, align 8
  %8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %4, i32 0, i32 0
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %8, align 8
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %9, align 8
  store %"class.std::vector.86"* %2, %"class.std::vector.86"** %6, align 8
  %10 = load %"class.std::vector.86"*, %"class.std::vector.86"** %6, align 8
  store %"class.std::vector.86"* %10, %"class.std::vector.86"** %7, align 8
  br label %11

; <label>:11:                                     ; preds = %17, %3
  %12 = call zeroext i1 @_ZN9__gnu_cxxneIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEEbRKNS_17__normal_iteratorIT_T0_EESD_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %4, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %5) #3
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %11
  %14 = load %"class.std::vector.86"*, %"class.std::vector.86"** %7, align 8
  %15 = call %"class.std::vector.86"* @_ZSt11__addressofISt6vectorIcSaIcEEEPT_RS3_(%"class.std::vector.86"* dereferenceable(24) %14) #3
  %16 = call dereferenceable(24) %"class.std::vector.86"* @_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEdeEv(%"class.__gnu_cxx::__normal_iterator"* %4) #3
  call void @_ZSt10_ConstructISt6vectorIcSaIcEEJRKS2_EEvPT_DpOT0_(%"class.std::vector.86"* %15, %"class.std::vector.86"* dereferenceable(24) %16)
  br label %17

; <label>:17:                                     ; preds = %13
  %18 = call dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEppEv(%"class.__gnu_cxx::__normal_iterator"* %4) #3
  %19 = load %"class.std::vector.86"*, %"class.std::vector.86"** %7, align 8
  %20 = getelementptr inbounds %"class.std::vector.86", %"class.std::vector.86"* %19, i32 1
  store %"class.std::vector.86"* %20, %"class.std::vector.86"** %7, align 8
  br label %11

; <label>:21:                                     ; preds = %11
  %22 = load %"class.std::vector.86"*, %"class.std::vector.86"** %7, align 8
  ret %"class.std::vector.86"* %22
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr zeroext i1 @_ZN9__gnu_cxxneIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEEbRKNS_17__normal_iteratorIT_T0_EESD_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8), %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8)) #6 comdat {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %4 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %1, %"class.__gnu_cxx::__normal_iterator"** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  %6 = call dereferenceable(8) %"class.std::vector.86"** @_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %5) #3
  %7 = load %"class.std::vector.86"*, %"class.std::vector.86"** %6, align 8
  %8 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %4, align 8
  %9 = call dereferenceable(8) %"class.std::vector.86"** @_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %8) #3
  %10 = load %"class.std::vector.86"*, %"class.std::vector.86"** %9, align 8
  %11 = icmp ne %"class.std::vector.86"* %7, %10
  ret i1 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt10_ConstructISt6vectorIcSaIcEEJRKS2_EEvPT_DpOT0_(%"class.std::vector.86"*, %"class.std::vector.86"* dereferenceable(24)) #6 comdat {
  %3 = alloca %"class.std::vector.86"*, align 8
  %4 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %3, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %4, align 8
  %5 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %6 = bitcast %"class.std::vector.86"* %5 to i8*
  %7 = bitcast i8* %6 to %"class.std::vector.86"*
  %8 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %9 = call dereferenceable(24) %"class.std::vector.86"* @_ZSt7forwardIRKSt6vectorIcSaIcEEEOT_RNSt16remove_referenceIS5_E4typeE(%"class.std::vector.86"* dereferenceable(24) %8) #3
  call void @_ZNSt6vectorIcSaIcEEC2ERKS1_(%"class.std::vector.86"* %7, %"class.std::vector.86"* dereferenceable(24) %9)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %"class.std::vector.86"* @_ZSt11__addressofISt6vectorIcSaIcEEEPT_RS3_(%"class.std::vector.86"* dereferenceable(24)) #6 comdat {
  %2 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %2, align 8
  %3 = load %"class.std::vector.86"*, %"class.std::vector.86"** %2, align 8
  ret %"class.std::vector.86"* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(24) %"class.std::vector.86"* @_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEdeEv(%"class.__gnu_cxx::__normal_iterator"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  %5 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  ret %"class.std::vector.86"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(8) %"class.__gnu_cxx::__normal_iterator"* @_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEppEv(%"class.__gnu_cxx::__normal_iterator"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  %5 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %6 = getelementptr inbounds %"class.std::vector.86", %"class.std::vector.86"* %5, i32 1
  store %"class.std::vector.86"* %6, %"class.std::vector.86"** %4, align 8
  ret %"class.__gnu_cxx::__normal_iterator"* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(8) %"class.std::vector.86"** @_ZNK9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %3, i32 0, i32 0
  ret %"class.std::vector.86"** %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(24) %"class.std::vector.86"* @_ZSt7forwardIRKSt6vectorIcSaIcEEEOT_RNSt16remove_referenceIS5_E4typeE(%"class.std::vector.86"* dereferenceable(24)) #6 comdat {
  %2 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %2, align 8
  %3 = load %"class.std::vector.86"*, %"class.std::vector.86"** %2, align 8
  ret %"class.std::vector.86"* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt6vectorIcSaIcEEC2ERKS1_(%"class.std::vector.86"*, %"class.std::vector.86"* dereferenceable(24)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.std::vector.86"*, align 8
  %4 = alloca %"class.std::vector.86"*, align 8
  %5 = alloca %"class.std::allocator.32", align 1
  %6 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %3, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %4, align 8
  %8 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %9 = bitcast %"class.std::vector.86"* %8 to %"struct.std::_Vector_base.92"*
  %10 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %11 = call i64 @_ZNKSt6vectorIcSaIcEE4sizeEv(%"class.std::vector.86"* %10) #3
  %12 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %13 = bitcast %"class.std::vector.86"* %12 to %"struct.std::_Vector_base.92"*
  %14 = call dereferenceable(1) %"class.std::allocator.32"* @_ZNKSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.92"* %13) #3
  call void @_ZN9__gnu_cxx14__alloc_traitsISaIcEE17_S_select_on_copyERKS1_(%"class.std::allocator.32"* sret %5, %"class.std::allocator.32"* dereferenceable(1) %14)
  call void @_ZNSt12_Vector_baseIcSaIcEEC2EmRKS0_(%"struct.std::_Vector_base.92"* %9, i64 %11, %"class.std::allocator.32"* dereferenceable(1) %5)
  call void @_ZNSaIcED1Ev(%"class.std::allocator.32"* %5) #3
  %15 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %16 = call i8* @_ZNKSt6vectorIcSaIcEE5beginEv(%"class.std::vector.86"* %15) #3
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %6, i32 0, i32 0
  store i8* %16, i8** %17, align 8
  %18 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %19 = call i8* @_ZNKSt6vectorIcSaIcEE3endEv(%"class.std::vector.86"* %18) #3
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %7, i32 0, i32 0
  store i8* %19, i8** %20, align 8
  %21 = bitcast %"class.std::vector.86"* %8 to %"struct.std::_Vector_base.92"*
  %22 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %21, i32 0, i32 0
  %23 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %22, i32 0, i32 0
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast %"class.std::vector.86"* %8 to %"struct.std::_Vector_base.92"*
  %26 = call dereferenceable(1) %"class.std::allocator.32"* @_ZNSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.92"* %25) #3
  %27 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %6, i32 0, i32 0
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %7, i32 0, i32 0
  %30 = load i8*, i8** %29, align 8
  %31 = call i8* @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPccET0_T_SA_S9_RSaIT1_E(i8* %28, i8* %30, i8* %24, %"class.std::allocator.32"* dereferenceable(1) %26)
  %32 = bitcast %"class.std::vector.86"* %8 to %"struct.std::_Vector_base.92"*
  %33 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %32, i32 0, i32 0
  %34 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %33, i32 0, i32 1
  store i8* %31, i8** %34, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i64 @_ZNKSt6vectorIcSaIcEE4sizeEv(%"class.std::vector.86"*) #6 comdat align 2 {
  %2 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %2, align 8
  %3 = load %"class.std::vector.86"*, %"class.std::vector.86"** %2, align 8
  %4 = bitcast %"class.std::vector.86"* %3 to %"struct.std::_Vector_base.92"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %5, i32 0, i32 1
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast %"class.std::vector.86"* %3 to %"struct.std::_Vector_base.92"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %8, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %9, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = ptrtoint i8* %7 to i64
  %13 = ptrtoint i8* %11 to i64
  %14 = sub i64 %12, %13
  ret i64 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaIcEE17_S_select_on_copyERKS1_(%"class.std::allocator.32"* noalias sret, %"class.std::allocator.32"* dereferenceable(1)) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.32"*, align 8
  store %"class.std::allocator.32"* %1, %"class.std::allocator.32"** %3, align 8
  %4 = load %"class.std::allocator.32"*, %"class.std::allocator.32"** %3, align 8
  call void @_ZNSt16allocator_traitsISaIcEE37select_on_container_copy_constructionERKS0_(%"class.std::allocator.32"* sret %0, %"class.std::allocator.32"* dereferenceable(1) %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.32"* @_ZNKSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.92"*) #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base.92"*, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %2, align 8
  %3 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %4 to %"class.std::allocator.32"*
  ret %"class.std::allocator.32"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseIcSaIcEEC2EmRKS0_(%"struct.std::_Vector_base.92"*, i64, %"class.std::allocator.32"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base.92"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %"class.std::allocator.32"*, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %4, align 8
  store i64 %1, i64* %5, align 8
  store %"class.std::allocator.32"* %2, %"class.std::allocator.32"** %6, align 8
  %7 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %4, align 8
  %8 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %7, i32 0, i32 0
  %9 = load %"class.std::allocator.32"*, %"class.std::allocator.32"** %6, align 8
  call void @_ZNSt12_Vector_baseIcSaIcEE12_Vector_implC2ERKS0_(%"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %8, %"class.std::allocator.32"* dereferenceable(1) %9) #3
  %10 = load i64, i64* %5, align 8
  call void @_ZNSt12_Vector_baseIcSaIcEE17_M_create_storageEm(%"struct.std::_Vector_base.92"* %7, i64 %10)
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSaIcED1Ev(%"class.std::allocator.32"*) unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPccET0_T_SA_S9_RSaIT1_E(i8*, i8*, i8*, %"class.std::allocator.32"* dereferenceable(1)) #6 comdat {
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %6 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %7 = alloca i8*, align 8
  %8 = alloca %"class.std::allocator.32"*, align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %10 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %5, i32 0, i32 0
  store i8* %0, i8** %11, align 8
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %6, i32 0, i32 0
  store i8* %1, i8** %12, align 8
  store i8* %2, i8** %7, align 8
  store %"class.std::allocator.32"* %3, %"class.std::allocator.32"** %8, align 8
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %9 to i8*
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 8, i32 8, i1 false)
  %15 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %10 to i8*
  %16 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 8, i32 8, i1 false)
  %17 = load i8*, i8** %7, align 8
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %9, i32 0, i32 0
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %10, i32 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = call i8* @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET0_T_SA_S9_(i8* %19, i8* %21, i8* %17)
  ret i8* %22
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZNKSt6vectorIcSaIcEE5beginEv(%"class.std::vector.86"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %3 = alloca %"class.std::vector.86"*, align 8
  %4 = alloca i8*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %3, align 8
  %5 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %6 = bitcast %"class.std::vector.86"* %5 to %"struct.std::_Vector_base.92"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %7, i32 0, i32 0
  %9 = load i8*, i8** %8, align 8
  store i8* %9, i8** %4, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.93"* %2, i8** dereferenceable(8) %4) #3
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %2, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  ret i8* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZNKSt6vectorIcSaIcEE3endEv(%"class.std::vector.86"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %3 = alloca %"class.std::vector.86"*, align 8
  %4 = alloca i8*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %3, align 8
  %5 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %6 = bitcast %"class.std::vector.86"* %5 to %"struct.std::_Vector_base.92"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %7, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8
  store i8* %9, i8** %4, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.93"* %2, i8** dereferenceable(8) %4) #3
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %2, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  ret i8* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.32"* @_ZNSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.92"*) #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base.92"*, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %2, align 8
  %3 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %4 to %"class.std::allocator.32"*
  ret %"class.std::allocator.32"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt16allocator_traitsISaIcEE37select_on_container_copy_constructionERKS0_(%"class.std::allocator.32"* noalias sret, %"class.std::allocator.32"* dereferenceable(1)) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.32"*, align 8
  store %"class.std::allocator.32"* %1, %"class.std::allocator.32"** %3, align 8
  %4 = load %"class.std::allocator.32"*, %"class.std::allocator.32"** %3, align 8
  call void @_ZNSaIcEC1ERKS_(%"class.std::allocator.32"* %0, %"class.std::allocator.32"* dereferenceable(1) %4) #3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSaIcEC1ERKS_(%"class.std::allocator.32"*, %"class.std::allocator.32"* dereferenceable(1)) unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseIcSaIcEE12_Vector_implC2ERKS0_(%"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"*, %"class.std::allocator.32"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"*, align 8
  %4 = alloca %"class.std::allocator.32"*, align 8
  store %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %0, %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"** %3, align 8
  store %"class.std::allocator.32"* %1, %"class.std::allocator.32"** %4, align 8
  %5 = load %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"*, %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"** %3, align 8
  %6 = bitcast %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %5 to %"class.std::allocator.32"*
  %7 = load %"class.std::allocator.32"*, %"class.std::allocator.32"** %4, align 8
  call void @_ZNSaIcEC2ERKS_(%"class.std::allocator.32"* %6, %"class.std::allocator.32"* dereferenceable(1) %7) #3
  %8 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %5, i32 0, i32 0
  store i8* null, i8** %8, align 8
  %9 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %5, i32 0, i32 1
  store i8* null, i8** %9, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %5, i32 0, i32 2
  store i8* null, i8** %10, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseIcSaIcEE17_M_create_storageEm(%"struct.std::_Vector_base.92"*, i64) #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base.92"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i8* @_ZNSt12_Vector_baseIcSaIcEE11_M_allocateEm(%"struct.std::_Vector_base.92"* %5, i64 %6)
  %8 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %5, i32 0, i32 0
  %9 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %8, i32 0, i32 0
  store i8* %7, i8** %9, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %5, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %5, i32 0, i32 0
  %14 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %13, i32 0, i32 1
  store i8* %12, i8** %14, align 8
  %15 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %5, i32 0, i32 0
  %16 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %15, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = load i64, i64* %4, align 8
  %19 = getelementptr inbounds i8, i8* %17, i64 %18
  %20 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %5, i32 0, i32 0
  %21 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %20, i32 0, i32 2
  store i8* %19, i8** %21, align 8
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSaIcEC2ERKS_(%"class.std::allocator.32"*, %"class.std::allocator.32"* dereferenceable(1)) unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZNSt12_Vector_baseIcSaIcEE11_M_allocateEm(%"struct.std::_Vector_base.92"*, i64) #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base.92"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %5, i32 0, i32 0
  %10 = bitcast %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %9 to %"class.std::allocator.32"*
  %11 = load i64, i64* %4, align 8
  %12 = call i8* @_ZNSt16allocator_traitsISaIcEE8allocateERS0_m(%"class.std::allocator.32"* dereferenceable(1) %10, i64 %11)
  br label %14

; <label>:13:                                     ; preds = %2
  br label %14

; <label>:14:                                     ; preds = %13, %8
  %15 = phi i8* [ %12, %8 ], [ null, %13 ]
  ret i8* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZNSt16allocator_traitsISaIcEE8allocateERS0_m(%"class.std::allocator.32"* dereferenceable(1), i64) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.32"*, align 8
  %4 = alloca i64, align 8
  store %"class.std::allocator.32"* %0, %"class.std::allocator.32"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"class.std::allocator.32"*, %"class.std::allocator.32"** %3, align 8
  %6 = bitcast %"class.std::allocator.32"* %5 to %"class.__gnu_cxx::new_allocator.33"*
  %7 = load i64, i64* %4, align 8
  %8 = call i8* @_ZN9__gnu_cxx13new_allocatorIcE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.33"* %6, i64 %7, i8* null)
  ret i8* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZN9__gnu_cxx13new_allocatorIcE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.33"*, i64, i8*) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator.33"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator.33"* %0, %"class.__gnu_cxx::new_allocator.33"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator.33"*, %"class.__gnu_cxx::new_allocator.33"** %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = call i64 @_ZNK9__gnu_cxx13new_allocatorIcE8max_sizeEv(%"class.__gnu_cxx::new_allocator.33"* %7) #3
  %10 = icmp ugt i64 %8, %9
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  call void @_ZSt17__throw_bad_allocv() #11
  unreachable

; <label>:12:                                     ; preds = %3
  %13 = load i64, i64* %5, align 8
  %14 = mul i64 %13, 1
  %15 = call i8* @_Znwm(i64 %14)
  ret i8* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i64 @_ZNK9__gnu_cxx13new_allocatorIcE8max_sizeEv(%"class.__gnu_cxx::new_allocator.33"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator.33"*, align 8
  store %"class.__gnu_cxx::new_allocator.33"* %0, %"class.__gnu_cxx::new_allocator.33"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator.33"*, %"class.__gnu_cxx::new_allocator.33"** %2, align 8
  ret i64 -1
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET0_T_SA_S9_(i8*, i8*, i8*) #6 comdat {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  %8 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %4, i32 0, i32 0
  store i8* %0, i8** %10, align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %5, i32 0, i32 0
  store i8* %1, i8** %11, align 8
  store i8* %2, i8** %6, align 8
  store i8 1, i8* %7, align 1
  %12 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %8 to i8*
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 8, i32 8, i1 false)
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %9 to i8*
  %15 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 8, i1 false)
  %16 = load i8*, i8** %6, align 8
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %8, i32 0, i32 0
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %9, i32 0, i32 0
  %20 = load i8*, i8** %19, align 8
  %21 = call i8* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcEET0_T_SC_SB_(i8* %18, i8* %20, i8* %16)
  ret i8* %21
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcEET0_T_SC_SB_(i8*, i8*, i8*) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %8 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %4, i32 0, i32 0
  store i8* %0, i8** %9, align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %5, i32 0, i32 0
  store i8* %1, i8** %10, align 8
  store i8* %2, i8** %6, align 8
  %11 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %7 to i8*
  %12 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 8, i1 false)
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %8 to i8*
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 8, i32 8, i1 false)
  %15 = load i8*, i8** %6, align 8
  %16 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %7, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %8, i32 0, i32 0
  %19 = load i8*, i8** %18, align 8
  %20 = call i8* @_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET0_T_SA_S9_(i8* %17, i8* %19, i8* %15)
  ret i8* %20
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET0_T_SA_S9_(i8*, i8*, i8*) #6 comdat {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %8 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %10 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %4, i32 0, i32 0
  store i8* %0, i8** %11, align 8
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %5, i32 0, i32 0
  store i8* %1, i8** %12, align 8
  store i8* %2, i8** %6, align 8
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %8 to i8*
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 8, i32 8, i1 false)
  %15 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %8, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = call i8* @_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEET_S8_(i8* %16)
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %7, i32 0, i32 0
  store i8* %17, i8** %18, align 8
  %19 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %10 to i8*
  %20 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 8, i32 8, i1 false)
  %21 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %10, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = call i8* @_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEET_S8_(i8* %22)
  %24 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %9, i32 0, i32 0
  store i8* %23, i8** %24, align 8
  %25 = load i8*, i8** %6, align 8
  %26 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %7, i32 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %9, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = call i8* @_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET1_T0_SA_S9_(i8* %27, i8* %29, i8* %25)
  ret i8* %30
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt14__copy_move_a2ILb0EN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEPcET1_T0_SA_S9_(i8*, i8*, i8*) #6 comdat {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %8 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %4, i32 0, i32 0
  store i8* %0, i8** %9, align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %5, i32 0, i32 0
  store i8* %1, i8** %10, align 8
  store i8* %2, i8** %6, align 8
  %11 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %7 to i8*
  %12 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 8, i1 false)
  %13 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %7, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  %15 = call i8* @_ZSt12__niter_baseIPKcSt6vectorIcSaIcEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE(i8* %14)
  %16 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %8 to i8*
  %17 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 8, i32 8, i1 false)
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %8, i32 0, i32 0
  %19 = load i8*, i8** %18, align 8
  %20 = call i8* @_ZSt12__niter_baseIPKcSt6vectorIcSaIcEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE(i8* %19)
  %21 = load i8*, i8** %6, align 8
  %22 = call i8* @_ZSt12__niter_baseIPcET_S1_(i8* %21)
  %23 = call i8* @_ZSt13__copy_move_aILb0EPKcPcET1_T0_S4_S3_(i8* %15, i8* %20, i8* %22)
  ret i8* %23
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEEET_S8_(i8*) #6 comdat {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %3 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %3, i32 0, i32 0
  store i8* %0, i8** %4, align 8
  %5 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %2 to i8*
  %6 = bitcast %"class.__gnu_cxx::__normal_iterator.93"* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 8, i32 8, i1 false)
  %7 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %2, i32 0, i32 0
  %8 = load i8*, i8** %7, align 8
  ret i8* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt13__copy_move_aILb0EPKcPcET1_T0_S4_S3_(i8*, i8*, i8*) #6 comdat {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  store i8 1, i8* %7, align 1
  %8 = load i8*, i8** %4, align 8
  %9 = load i8*, i8** %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = call i8* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIcEEPT_PKS3_S6_S4_(i8* %8, i8* %9, i8* %10)
  ret i8* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt12__niter_baseIPKcSt6vectorIcSaIcEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE(i8*) #6 comdat {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.93", align 8
  %3 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %2, i32 0, i32 0
  store i8* %0, i8** %3, align 8
  %4 = call dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEE4baseEv(%"class.__gnu_cxx::__normal_iterator.93"* %2) #3
  %5 = load i8*, i8** %4, align 8
  ret i8* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZSt12__niter_baseIPcET_S1_(i8*) #6 comdat {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  ret i8* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i8* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIcEEPT_PKS3_S6_S4_(i8*, i8*, i8*) #6 comdat align 2 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = ptrtoint i8* %8 to i64
  %11 = ptrtoint i8* %9 to i64
  %12 = sub i64 %10, %11
  store i64 %12, i64* %7, align 8
  %13 = load i64, i64* %7, align 8
  %14 = icmp ne i64 %13, 0
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %3
  %16 = load i8*, i8** %6, align 8
  %17 = load i8*, i8** %4, align 8
  %18 = load i64, i64* %7, align 8
  %19 = mul i64 1, %18
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %16, i8* %17, i64 %19, i32 1, i1 false)
  br label %20

; <label>:20:                                     ; preds = %15, %3
  %21 = load i8*, i8** %6, align 8
  %22 = load i64, i64* %7, align 8
  %23 = getelementptr inbounds i8, i8* %21, i64 %22
  ret i8* %23
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #8

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(8) i8** @_ZNK9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEE4baseEv(%"class.__gnu_cxx::__normal_iterator.93"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.93"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.93"* %0, %"class.__gnu_cxx::__normal_iterator.93"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator.93"*, %"class.__gnu_cxx::__normal_iterator.93"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %3, i32 0, i32 0
  ret i8** %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx17__normal_iteratorIPKcSt6vectorIcSaIcEEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.93"*, i8** dereferenceable(8)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator.93"*, align 8
  %4 = alloca i8**, align 8
  store %"class.__gnu_cxx::__normal_iterator.93"* %0, %"class.__gnu_cxx::__normal_iterator.93"** %3, align 8
  store i8** %1, i8*** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator.93"*, %"class.__gnu_cxx::__normal_iterator.93"** %3, align 8
  %6 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.93", %"class.__gnu_cxx::__normal_iterator.93"* %5, i32 0, i32 0
  %7 = load i8**, i8*** %4, align 8
  %8 = load i8*, i8** %7, align 8
  store i8* %8, i8** %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx17__normal_iteratorIPKSt6vectorIcSaIcEES1_IS3_SaIS3_EEEC2ERKS5_(%"class.__gnu_cxx::__normal_iterator"*, %"class.std::vector.86"** dereferenceable(8)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %4 = alloca %"class.std::vector.86"**, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %0, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  store %"class.std::vector.86"** %1, %"class.std::vector.86"*** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %3, align 8
  %6 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %5, i32 0, i32 0
  %7 = load %"class.std::vector.86"**, %"class.std::vector.86"*** %4, align 8
  %8 = load %"class.std::vector.86"*, %"class.std::vector.86"** %7, align 8
  store %"class.std::vector.86"* %8, %"class.std::vector.86"** %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i64 @_ZNKSt6vectorI5TokenSaIS0_EE4sizeEv(%"class.std::vector.87"*) #6 comdat align 2 {
  %2 = alloca %"class.std::vector.87"*, align 8
  store %"class.std::vector.87"* %0, %"class.std::vector.87"** %2, align 8
  %3 = load %"class.std::vector.87"*, %"class.std::vector.87"** %2, align 8
  %4 = bitcast %"class.std::vector.87"* %3 to %"struct.std::_Vector_base.88"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %5, i32 0, i32 1
  %7 = load %struct.Token*, %struct.Token** %6, align 8
  %8 = bitcast %"class.std::vector.87"* %3 to %"struct.std::_Vector_base.88"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %8, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %9, i32 0, i32 0
  %11 = load %struct.Token*, %struct.Token** %10, align 8
  %12 = ptrtoint %struct.Token* %7 to i64
  %13 = ptrtoint %struct.Token* %11 to i64
  %14 = sub i64 %12, %13
  %15 = sdiv exact i64 %14, 64
  ret i64 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI5TokenEE17_S_select_on_copyERKS2_(%"class.std::allocator.89"* noalias sret, %"class.std::allocator.89"* dereferenceable(1)) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.89"*, align 8
  store %"class.std::allocator.89"* %1, %"class.std::allocator.89"** %3, align 8
  %4 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %3, align 8
  call void @_ZNSt16allocator_traitsISaI5TokenEE37select_on_container_copy_constructionERKS1_(%"class.std::allocator.89"* sret %0, %"class.std::allocator.89"* dereferenceable(1) %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.89"* @_ZNKSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.88"*) #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base.88"*, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %2, align 8
  %3 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %4 to %"class.std::allocator.89"*
  ret %"class.std::allocator.89"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI5TokenSaIS0_EEC2EmRKS1_(%"struct.std::_Vector_base.88"*, i64, %"class.std::allocator.89"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base.88"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca %"class.std::allocator.89"*, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %4, align 8
  store i64 %1, i64* %5, align 8
  store %"class.std::allocator.89"* %2, %"class.std::allocator.89"** %6, align 8
  %7 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %4, align 8
  %8 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %7, i32 0, i32 0
  %9 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %6, align 8
  call void @_ZNSt12_Vector_baseI5TokenSaIS0_EE12_Vector_implC2ERKS1_(%"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %8, %"class.std::allocator.89"* dereferenceable(1) %9) #3
  %10 = load i64, i64* %5, align 8
  call void @_ZNSt12_Vector_baseI5TokenSaIS0_EE17_M_create_storageEm(%"struct.std::_Vector_base.88"* %7, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSaI5TokenED2Ev(%"class.std::allocator.89"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.std::allocator.89"*, align 8
  store %"class.std::allocator.89"* %0, %"class.std::allocator.89"** %2, align 8
  %3 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %2, align 8
  %4 = bitcast %"class.std::allocator.89"* %3 to %"class.__gnu_cxx::new_allocator.90"*
  call void @_ZN9__gnu_cxx13new_allocatorI5TokenED2Ev(%"class.__gnu_cxx::new_allocator.90"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS2_SaIS2_EEEEPS2_S2_ET0_T_SB_SA_RSaIT1_E(%struct.Token*, %struct.Token*, %struct.Token*, %"class.std::allocator.89"* dereferenceable(1)) #6 comdat {
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %6 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %7 = alloca %struct.Token*, align 8
  %8 = alloca %"class.std::allocator.89"*, align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %10 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %5, i32 0, i32 0
  store %struct.Token* %0, %struct.Token** %11, align 8
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %6, i32 0, i32 0
  store %struct.Token* %1, %struct.Token** %12, align 8
  store %struct.Token* %2, %struct.Token** %7, align 8
  store %"class.std::allocator.89"* %3, %"class.std::allocator.89"** %8, align 8
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %9 to i8*
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 8, i32 8, i1 false)
  %15 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %10 to i8*
  %16 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 8, i32 8, i1 false)
  %17 = load %struct.Token*, %struct.Token** %7, align 8
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %9, i32 0, i32 0
  %19 = load %struct.Token*, %struct.Token** %18, align 8
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %10, i32 0, i32 0
  %21 = load %struct.Token*, %struct.Token** %20, align 8
  %22 = call %struct.Token* @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS2_SaIS2_EEEEPS2_ET0_T_SB_SA_(%struct.Token* %19, %struct.Token* %21, %struct.Token* %17)
  ret %struct.Token* %22
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZNKSt6vectorI5TokenSaIS0_EE5beginEv(%"class.std::vector.87"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %3 = alloca %"class.std::vector.87"*, align 8
  %4 = alloca %struct.Token*, align 8
  store %"class.std::vector.87"* %0, %"class.std::vector.87"** %3, align 8
  %5 = load %"class.std::vector.87"*, %"class.std::vector.87"** %3, align 8
  %6 = bitcast %"class.std::vector.87"* %5 to %"struct.std::_Vector_base.88"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %7, i32 0, i32 0
  %9 = load %struct.Token*, %struct.Token** %8, align 8
  store %struct.Token* %9, %struct.Token** %4, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEC2ERKS3_(%"class.__gnu_cxx::__normal_iterator.94"* %2, %struct.Token** dereferenceable(8) %4) #3
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %2, i32 0, i32 0
  %11 = load %struct.Token*, %struct.Token** %10, align 8
  ret %struct.Token* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZNKSt6vectorI5TokenSaIS0_EE3endEv(%"class.std::vector.87"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %3 = alloca %"class.std::vector.87"*, align 8
  %4 = alloca %struct.Token*, align 8
  store %"class.std::vector.87"* %0, %"class.std::vector.87"** %3, align 8
  %5 = load %"class.std::vector.87"*, %"class.std::vector.87"** %3, align 8
  %6 = bitcast %"class.std::vector.87"* %5 to %"struct.std::_Vector_base.88"*
  %7 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %7, i32 0, i32 1
  %9 = load %struct.Token*, %struct.Token** %8, align 8
  store %struct.Token* %9, %struct.Token** %4, align 8
  call void @_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEC2ERKS3_(%"class.__gnu_cxx::__normal_iterator.94"* %2, %struct.Token** dereferenceable(8) %4) #3
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %2, i32 0, i32 0
  %11 = load %struct.Token*, %struct.Token** %10, align 8
  ret %struct.Token* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.89"* @_ZNSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.88"*) #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base.88"*, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %2, align 8
  %3 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %3, i32 0, i32 0
  %5 = bitcast %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %4 to %"class.std::allocator.89"*
  ret %"class.std::allocator.89"* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt16allocator_traitsISaI5TokenEE37select_on_container_copy_constructionERKS1_(%"class.std::allocator.89"* noalias sret, %"class.std::allocator.89"* dereferenceable(1)) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.89"*, align 8
  store %"class.std::allocator.89"* %1, %"class.std::allocator.89"** %3, align 8
  %4 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %3, align 8
  call void @_ZNSaI5TokenEC2ERKS0_(%"class.std::allocator.89"* %0, %"class.std::allocator.89"* dereferenceable(1) %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSaI5TokenEC2ERKS0_(%"class.std::allocator.89"*, %"class.std::allocator.89"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.89"*, align 8
  %4 = alloca %"class.std::allocator.89"*, align 8
  store %"class.std::allocator.89"* %0, %"class.std::allocator.89"** %3, align 8
  store %"class.std::allocator.89"* %1, %"class.std::allocator.89"** %4, align 8
  %5 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %3, align 8
  %6 = bitcast %"class.std::allocator.89"* %5 to %"class.__gnu_cxx::new_allocator.90"*
  %7 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %4, align 8
  %8 = bitcast %"class.std::allocator.89"* %7 to %"class.__gnu_cxx::new_allocator.90"*
  call void @_ZN9__gnu_cxx13new_allocatorI5TokenEC2ERKS2_(%"class.__gnu_cxx::new_allocator.90"* %6, %"class.__gnu_cxx::new_allocator.90"* dereferenceable(1) %8) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI5TokenEC2ERKS2_(%"class.__gnu_cxx::new_allocator.90"*, %"class.__gnu_cxx::new_allocator.90"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::new_allocator.90"*, align 8
  %4 = alloca %"class.__gnu_cxx::new_allocator.90"*, align 8
  store %"class.__gnu_cxx::new_allocator.90"* %0, %"class.__gnu_cxx::new_allocator.90"** %3, align 8
  store %"class.__gnu_cxx::new_allocator.90"* %1, %"class.__gnu_cxx::new_allocator.90"** %4, align 8
  %5 = load %"class.__gnu_cxx::new_allocator.90"*, %"class.__gnu_cxx::new_allocator.90"** %3, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI5TokenSaIS0_EE12_Vector_implC2ERKS1_(%"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"*, %"class.std::allocator.89"* dereferenceable(1)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"*, align 8
  %4 = alloca %"class.std::allocator.89"*, align 8
  store %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %0, %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"** %3, align 8
  store %"class.std::allocator.89"* %1, %"class.std::allocator.89"** %4, align 8
  %5 = load %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"*, %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"** %3, align 8
  %6 = bitcast %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %5 to %"class.std::allocator.89"*
  %7 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %4, align 8
  call void @_ZNSaI5TokenEC2ERKS0_(%"class.std::allocator.89"* %6, %"class.std::allocator.89"* dereferenceable(1) %7) #3
  %8 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %5, i32 0, i32 0
  store %struct.Token* null, %struct.Token** %8, align 8
  %9 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %5, i32 0, i32 1
  store %struct.Token* null, %struct.Token** %9, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %5, i32 0, i32 2
  store %struct.Token* null, %struct.Token** %10, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI5TokenSaIS0_EE17_M_create_storageEm(%"struct.std::_Vector_base.88"*, i64) #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base.88"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call %struct.Token* @_ZNSt12_Vector_baseI5TokenSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base.88"* %5, i64 %6)
  %8 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %5, i32 0, i32 0
  %9 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %8, i32 0, i32 0
  store %struct.Token* %7, %struct.Token** %9, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %5, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %10, i32 0, i32 0
  %12 = load %struct.Token*, %struct.Token** %11, align 8
  %13 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %5, i32 0, i32 0
  %14 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %13, i32 0, i32 1
  store %struct.Token* %12, %struct.Token** %14, align 8
  %15 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %5, i32 0, i32 0
  %16 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %15, i32 0, i32 0
  %17 = load %struct.Token*, %struct.Token** %16, align 8
  %18 = load i64, i64* %4, align 8
  %19 = getelementptr inbounds %struct.Token, %struct.Token* %17, i64 %18
  %20 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %5, i32 0, i32 0
  %21 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %20, i32 0, i32 2
  store %struct.Token* %19, %struct.Token** %21, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZNSt12_Vector_baseI5TokenSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base.88"*, i64) #6 comdat align 2 {
  %3 = alloca %"struct.std::_Vector_base.88"*, align 8
  %4 = alloca i64, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %5, i32 0, i32 0
  %10 = bitcast %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %9 to %"class.std::allocator.89"*
  %11 = load i64, i64* %4, align 8
  %12 = call %struct.Token* @_ZNSt16allocator_traitsISaI5TokenEE8allocateERS1_m(%"class.std::allocator.89"* dereferenceable(1) %10, i64 %11)
  br label %14

; <label>:13:                                     ; preds = %2
  br label %14

; <label>:14:                                     ; preds = %13, %8
  %15 = phi %struct.Token* [ %12, %8 ], [ null, %13 ]
  ret %struct.Token* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZNSt16allocator_traitsISaI5TokenEE8allocateERS1_m(%"class.std::allocator.89"* dereferenceable(1), i64) #6 comdat align 2 {
  %3 = alloca %"class.std::allocator.89"*, align 8
  %4 = alloca i64, align 8
  store %"class.std::allocator.89"* %0, %"class.std::allocator.89"** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %3, align 8
  %6 = bitcast %"class.std::allocator.89"* %5 to %"class.__gnu_cxx::new_allocator.90"*
  %7 = load i64, i64* %4, align 8
  %8 = call %struct.Token* @_ZN9__gnu_cxx13new_allocatorI5TokenE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.90"* %6, i64 %7, i8* null)
  ret %struct.Token* %8
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZN9__gnu_cxx13new_allocatorI5TokenE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.90"*, i64, i8*) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator.90"*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator.90"* %0, %"class.__gnu_cxx::new_allocator.90"** %4, align 8
  store i64 %1, i64* %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator.90"*, %"class.__gnu_cxx::new_allocator.90"** %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = call i64 @_ZNK9__gnu_cxx13new_allocatorI5TokenE8max_sizeEv(%"class.__gnu_cxx::new_allocator.90"* %7) #3
  %10 = icmp ugt i64 %8, %9
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  call void @_ZSt17__throw_bad_allocv() #11
  unreachable

; <label>:12:                                     ; preds = %3
  %13 = load i64, i64* %5, align 8
  %14 = mul i64 %13, 64
  %15 = call i8* @_Znwm(i64 %14)
  %16 = bitcast i8* %15 to %struct.Token*
  ret %struct.Token* %16
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr i64 @_ZNK9__gnu_cxx13new_allocatorI5TokenE8max_sizeEv(%"class.__gnu_cxx::new_allocator.90"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator.90"*, align 8
  store %"class.__gnu_cxx::new_allocator.90"* %0, %"class.__gnu_cxx::new_allocator.90"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator.90"*, %"class.__gnu_cxx::new_allocator.90"** %2, align 8
  ret i64 288230376151711743
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI5TokenED2Ev(%"class.__gnu_cxx::new_allocator.90"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::new_allocator.90"*, align 8
  store %"class.__gnu_cxx::new_allocator.90"* %0, %"class.__gnu_cxx::new_allocator.90"** %2, align 8
  %3 = load %"class.__gnu_cxx::new_allocator.90"*, %"class.__gnu_cxx::new_allocator.90"** %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS2_SaIS2_EEEEPS2_ET0_T_SB_SA_(%struct.Token*, %struct.Token*, %struct.Token*) #6 comdat {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %6 = alloca %struct.Token*, align 8
  %7 = alloca i8, align 1
  %8 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %4, i32 0, i32 0
  store %struct.Token* %0, %struct.Token** %10, align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %5, i32 0, i32 0
  store %struct.Token* %1, %struct.Token** %11, align 8
  store %struct.Token* %2, %struct.Token** %6, align 8
  store i8 1, i8* %7, align 1
  %12 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %8 to i8*
  %13 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 8, i32 8, i1 false)
  %14 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %9 to i8*
  %15 = bitcast %"class.__gnu_cxx::__normal_iterator.94"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 8, i1 false)
  %16 = load %struct.Token*, %struct.Token** %6, align 8
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %8, i32 0, i32 0
  %18 = load %struct.Token*, %struct.Token** %17, align 8
  %19 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %9, i32 0, i32 0
  %20 = load %struct.Token*, %struct.Token** %19, align 8
  %21 = call %struct.Token* @_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS4_SaIS4_EEEEPS4_EET0_T_SD_SC_(%struct.Token* %18, %struct.Token* %20, %struct.Token* %16)
  ret %struct.Token* %21
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS4_SaIS4_EEEEPS4_EET0_T_SD_SC_(%struct.Token*, %struct.Token*, %struct.Token*) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator.94", align 8
  %6 = alloca %struct.Token*, align 8
  %7 = alloca %struct.Token*, align 8
  %8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %4, i32 0, i32 0
  store %struct.Token* %0, %struct.Token** %8, align 8
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %5, i32 0, i32 0
  store %struct.Token* %1, %struct.Token** %9, align 8
  store %struct.Token* %2, %struct.Token** %6, align 8
  %10 = load %struct.Token*, %struct.Token** %6, align 8
  store %struct.Token* %10, %struct.Token** %7, align 8
  br label %11

; <label>:11:                                     ; preds = %17, %3
  %12 = call zeroext i1 @_ZN9__gnu_cxxneIPK5TokenSt6vectorIS1_SaIS1_EEEEbRKNS_17__normal_iteratorIT_T0_EESC_(%"class.__gnu_cxx::__normal_iterator.94"* dereferenceable(8) %4, %"class.__gnu_cxx::__normal_iterator.94"* dereferenceable(8) %5) #3
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %11
  %14 = load %struct.Token*, %struct.Token** %7, align 8
  %15 = call %struct.Token* @_ZSt11__addressofI5TokenEPT_RS1_(%struct.Token* dereferenceable(64) %14) #3
  %16 = call dereferenceable(64) %struct.Token* @_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEdeEv(%"class.__gnu_cxx::__normal_iterator.94"* %4) #3
  call void @_ZSt10_ConstructI5TokenJRKS0_EEvPT_DpOT0_(%struct.Token* %15, %struct.Token* dereferenceable(64) %16)
  br label %17

; <label>:17:                                     ; preds = %13
  %18 = call dereferenceable(8) %"class.__gnu_cxx::__normal_iterator.94"* @_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEppEv(%"class.__gnu_cxx::__normal_iterator.94"* %4) #3
  %19 = load %struct.Token*, %struct.Token** %7, align 8
  %20 = getelementptr inbounds %struct.Token, %struct.Token* %19, i32 1
  store %struct.Token* %20, %struct.Token** %7, align 8
  br label %11

; <label>:21:                                     ; preds = %11
  %22 = load %struct.Token*, %struct.Token** %7, align 8
  ret %struct.Token* %22
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr zeroext i1 @_ZN9__gnu_cxxneIPK5TokenSt6vectorIS1_SaIS1_EEEEbRKNS_17__normal_iteratorIT_T0_EESC_(%"class.__gnu_cxx::__normal_iterator.94"* dereferenceable(8), %"class.__gnu_cxx::__normal_iterator.94"* dereferenceable(8)) #6 comdat {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator.94"*, align 8
  %4 = alloca %"class.__gnu_cxx::__normal_iterator.94"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.94"* %0, %"class.__gnu_cxx::__normal_iterator.94"** %3, align 8
  store %"class.__gnu_cxx::__normal_iterator.94"* %1, %"class.__gnu_cxx::__normal_iterator.94"** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator.94"*, %"class.__gnu_cxx::__normal_iterator.94"** %3, align 8
  %6 = call dereferenceable(8) %struct.Token** @_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.94"* %5) #3
  %7 = load %struct.Token*, %struct.Token** %6, align 8
  %8 = load %"class.__gnu_cxx::__normal_iterator.94"*, %"class.__gnu_cxx::__normal_iterator.94"** %4, align 8
  %9 = call dereferenceable(8) %struct.Token** @_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.94"* %8) #3
  %10 = load %struct.Token*, %struct.Token** %9, align 8
  %11 = icmp ne %struct.Token* %7, %10
  ret i1 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt10_ConstructI5TokenJRKS0_EEvPT_DpOT0_(%struct.Token*, %struct.Token* dereferenceable(64)) #6 comdat {
  %3 = alloca %struct.Token*, align 8
  %4 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %3, align 8
  store %struct.Token* %1, %struct.Token** %4, align 8
  %5 = load %struct.Token*, %struct.Token** %3, align 8
  %6 = bitcast %struct.Token* %5 to i8*
  %7 = bitcast i8* %6 to %struct.Token*
  %8 = load %struct.Token*, %struct.Token** %4, align 8
  %9 = call dereferenceable(64) %struct.Token* @_ZSt7forwardIRK5TokenEOT_RNSt16remove_referenceIS3_E4typeE(%struct.Token* dereferenceable(64) %8) #3
  call void @_ZN5TokenC2ERKS_(%struct.Token* %7, %struct.Token* dereferenceable(64) %9)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr %struct.Token* @_ZSt11__addressofI5TokenEPT_RS1_(%struct.Token* dereferenceable(64)) #6 comdat {
  %2 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %2, align 8
  %3 = load %struct.Token*, %struct.Token** %2, align 8
  ret %struct.Token* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(64) %struct.Token* @_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEdeEv(%"class.__gnu_cxx::__normal_iterator.94"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.94"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.94"* %0, %"class.__gnu_cxx::__normal_iterator.94"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator.94"*, %"class.__gnu_cxx::__normal_iterator.94"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %3, i32 0, i32 0
  %5 = load %struct.Token*, %struct.Token** %4, align 8
  ret %struct.Token* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(8) %"class.__gnu_cxx::__normal_iterator.94"* @_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEppEv(%"class.__gnu_cxx::__normal_iterator.94"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.94"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.94"* %0, %"class.__gnu_cxx::__normal_iterator.94"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator.94"*, %"class.__gnu_cxx::__normal_iterator.94"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %3, i32 0, i32 0
  %5 = load %struct.Token*, %struct.Token** %4, align 8
  %6 = getelementptr inbounds %struct.Token, %struct.Token* %5, i32 1
  store %struct.Token* %6, %struct.Token** %4, align 8
  ret %"class.__gnu_cxx::__normal_iterator.94"* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(8) %struct.Token** @_ZNK9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.94"*) #6 comdat align 2 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator.94"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.94"* %0, %"class.__gnu_cxx::__normal_iterator.94"** %2, align 8
  %3 = load %"class.__gnu_cxx::__normal_iterator.94"*, %"class.__gnu_cxx::__normal_iterator.94"** %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %3, i32 0, i32 0
  ret %struct.Token** %4
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(64) %struct.Token* @_ZSt7forwardIRK5TokenEOT_RNSt16remove_referenceIS3_E4typeE(%struct.Token* dereferenceable(64)) #6 comdat {
  %2 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %2, align 8
  %3 = load %struct.Token*, %struct.Token** %2, align 8
  ret %struct.Token* %3
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN5TokenC2ERKS_(%struct.Token*, %struct.Token* dereferenceable(64)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %struct.Token*, align 8
  %4 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %3, align 8
  store %struct.Token* %1, %struct.Token** %4, align 8
  %5 = load %struct.Token*, %struct.Token** %3, align 8
  %6 = getelementptr inbounds %struct.Token, %struct.Token* %5, i32 0, i32 0
  %7 = load %struct.Token*, %struct.Token** %4, align 8
  %8 = getelementptr inbounds %struct.Token, %struct.Token* %7, i32 0, i32 0
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_(%"class.std::__cxx11::basic_string"* %6, %"class.std::__cxx11::basic_string"* dereferenceable(32) %8)
  %9 = getelementptr inbounds %struct.Token, %struct.Token* %5, i32 0, i32 1
  %10 = load %struct.Token*, %struct.Token** %4, align 8
  %11 = getelementptr inbounds %struct.Token, %struct.Token* %10, i32 0, i32 1
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_(%"class.std::__cxx11::basic_string"* %9, %"class.std::__cxx11::basic_string"* dereferenceable(32) %11)
  ret void
}

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_(%"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"* dereferenceable(32)) unnamed_addr #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx17__normal_iteratorIPK5TokenSt6vectorIS1_SaIS1_EEEC2ERKS3_(%"class.__gnu_cxx::__normal_iterator.94"*, %struct.Token** dereferenceable(8)) unnamed_addr #6 comdat align 2 {
  %3 = alloca %"class.__gnu_cxx::__normal_iterator.94"*, align 8
  %4 = alloca %struct.Token**, align 8
  store %"class.__gnu_cxx::__normal_iterator.94"* %0, %"class.__gnu_cxx::__normal_iterator.94"** %3, align 8
  store %struct.Token** %1, %struct.Token*** %4, align 8
  %5 = load %"class.__gnu_cxx::__normal_iterator.94"*, %"class.__gnu_cxx::__normal_iterator.94"** %3, align 8
  %6 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.94", %"class.__gnu_cxx::__normal_iterator.94"* %5, i32 0, i32 0
  %7 = load %struct.Token**, %struct.Token*** %4, align 8
  %8 = load %struct.Token*, %struct.Token** %7, align 8
  store %struct.Token* %8, %struct.Token** %6, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt6vectorI5TokenSaIS0_EED2Ev(%"class.std::vector.87"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.std::vector.87"*, align 8
  store %"class.std::vector.87"* %0, %"class.std::vector.87"** %2, align 8
  %3 = load %"class.std::vector.87"*, %"class.std::vector.87"** %2, align 8
  %4 = bitcast %"class.std::vector.87"* %3 to %"struct.std::_Vector_base.88"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %5, i32 0, i32 0
  %7 = load %struct.Token*, %struct.Token** %6, align 8
  %8 = bitcast %"class.std::vector.87"* %3 to %"struct.std::_Vector_base.88"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %8, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %9, i32 0, i32 1
  %11 = load %struct.Token*, %struct.Token** %10, align 8
  %12 = bitcast %"class.std::vector.87"* %3 to %"struct.std::_Vector_base.88"*
  %13 = call dereferenceable(1) %"class.std::allocator.89"* @_ZNSt12_Vector_baseI5TokenSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.88"* %12) #3
  call void @_ZSt8_DestroyIP5TokenS0_EvT_S2_RSaIT0_E(%struct.Token* %7, %struct.Token* %11, %"class.std::allocator.89"* dereferenceable(1) %13)
  %14 = bitcast %"class.std::vector.87"* %3 to %"struct.std::_Vector_base.88"*
  call void @_ZNSt12_Vector_baseI5TokenSaIS0_EED2Ev(%"struct.std::_Vector_base.88"* %14) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt6vectorIS_IcSaIcEESaIS1_EED2Ev(%"class.std::vector"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %0, %"class.std::vector"** %2, align 8
  %3 = load %"class.std::vector"*, %"class.std::vector"** %2, align 8
  %4 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %5, i32 0, i32 0
  %7 = load %"class.std::vector.86"*, %"class.std::vector.86"** %6, align 8
  %8 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %8, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %9, i32 0, i32 1
  %11 = load %"class.std::vector.86"*, %"class.std::vector.86"** %10, align 8
  %12 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  %13 = call dereferenceable(1) %"class.std::allocator.83"* @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %12) #3
  call void @_ZSt8_DestroyIPSt6vectorIcSaIcEES2_EvT_S4_RSaIT0_E(%"class.std::vector.86"* %7, %"class.std::vector.86"* %11, %"class.std::allocator.83"* dereferenceable(1) %13)
  %14 = bitcast %"class.std::vector"* %3 to %"struct.std::_Vector_base"*
  call void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EED2Ev(%"struct.std::_Vector_base"* %14) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyIP5TokenS0_EvT_S2_RSaIT0_E(%struct.Token*, %struct.Token*, %"class.std::allocator.89"* dereferenceable(1)) #6 comdat {
  %4 = alloca %struct.Token*, align 8
  %5 = alloca %struct.Token*, align 8
  %6 = alloca %"class.std::allocator.89"*, align 8
  store %struct.Token* %0, %struct.Token** %4, align 8
  store %struct.Token* %1, %struct.Token** %5, align 8
  store %"class.std::allocator.89"* %2, %"class.std::allocator.89"** %6, align 8
  %7 = load %struct.Token*, %struct.Token** %4, align 8
  %8 = load %struct.Token*, %struct.Token** %5, align 8
  call void @_ZSt8_DestroyIP5TokenEvT_S2_(%struct.Token* %7, %struct.Token* %8)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI5TokenSaIS0_EED2Ev(%"struct.std::_Vector_base.88"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base.88"*, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %2, align 8
  %3 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %3, i32 0, i32 0
  %5 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %4, i32 0, i32 0
  %6 = load %struct.Token*, %struct.Token** %5, align 8
  %7 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %3, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %7, i32 0, i32 2
  %9 = load %struct.Token*, %struct.Token** %8, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %3, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl", %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %10, i32 0, i32 0
  %12 = load %struct.Token*, %struct.Token** %11, align 8
  %13 = ptrtoint %struct.Token* %9 to i64
  %14 = ptrtoint %struct.Token* %12 to i64
  %15 = sub i64 %13, %14
  %16 = sdiv exact i64 %15, 64
  call void @_ZNSt12_Vector_baseI5TokenSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.88"* %3, %struct.Token* %6, i64 %16)
  %17 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %3, i32 0, i32 0
  call void @_ZNSt12_Vector_baseI5TokenSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %17) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyIP5TokenEvT_S2_(%struct.Token*, %struct.Token*) #6 comdat {
  %3 = alloca %struct.Token*, align 8
  %4 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %3, align 8
  store %struct.Token* %1, %struct.Token** %4, align 8
  %5 = load %struct.Token*, %struct.Token** %3, align 8
  %6 = load %struct.Token*, %struct.Token** %4, align 8
  call void @_ZNSt12_Destroy_auxILb0EE9__destroyIP5TokenEEvT_S4_(%struct.Token* %5, %struct.Token* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Destroy_auxILb0EE9__destroyIP5TokenEEvT_S4_(%struct.Token*, %struct.Token*) #6 comdat align 2 {
  %3 = alloca %struct.Token*, align 8
  %4 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %3, align 8
  store %struct.Token* %1, %struct.Token** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %6 = load %struct.Token*, %struct.Token** %3, align 8
  %7 = load %struct.Token*, %struct.Token** %4, align 8
  %8 = icmp ne %struct.Token* %6, %7
  br i1 %8, label %9, label %15

; <label>:9:                                      ; preds = %5
  %10 = load %struct.Token*, %struct.Token** %3, align 8
  %11 = call %struct.Token* @_ZSt11__addressofI5TokenEPT_RS1_(%struct.Token* dereferenceable(64) %10) #3
  call void @_ZSt8_DestroyI5TokenEvPT_(%struct.Token* %11)
  br label %12

; <label>:12:                                     ; preds = %9
  %13 = load %struct.Token*, %struct.Token** %3, align 8
  %14 = getelementptr inbounds %struct.Token, %struct.Token* %13, i32 1
  store %struct.Token* %14, %struct.Token** %3, align 8
  br label %5

; <label>:15:                                     ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyI5TokenEvPT_(%struct.Token*) #6 comdat {
  %2 = alloca %struct.Token*, align 8
  store %struct.Token* %0, %struct.Token** %2, align 8
  %3 = load %struct.Token*, %struct.Token** %2, align 8
  call void @_ZN5TokenD2Ev(%struct.Token* %3) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI5TokenSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.88"*, %struct.Token*, i64) #6 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base.88"*, align 8
  %5 = alloca %struct.Token*, align 8
  %6 = alloca i64, align 8
  store %"struct.std::_Vector_base.88"* %0, %"struct.std::_Vector_base.88"** %4, align 8
  store %struct.Token* %1, %struct.Token** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"struct.std::_Vector_base.88"*, %"struct.std::_Vector_base.88"** %4, align 8
  %8 = load %struct.Token*, %struct.Token** %5, align 8
  %9 = icmp ne %struct.Token* %8, null
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %"struct.std::_Vector_base.88", %"struct.std::_Vector_base.88"* %7, i32 0, i32 0
  %12 = bitcast %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %11 to %"class.std::allocator.89"*
  %13 = load %struct.Token*, %struct.Token** %5, align 8
  %14 = load i64, i64* %6, align 8
  call void @_ZNSt16allocator_traitsISaI5TokenEE10deallocateERS1_PS0_m(%"class.std::allocator.89"* dereferenceable(1) %12, %struct.Token* %13, i64 %14)
  br label %15

; <label>:15:                                     ; preds = %10, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI5TokenSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %0, %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"** %2, align 8
  %3 = load %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"*, %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"** %2, align 8
  %4 = bitcast %"struct.std::_Vector_base<Token, std::allocator<Token> >::_Vector_impl"* %3 to %"class.std::allocator.89"*
  call void @_ZNSaI5TokenED2Ev(%"class.std::allocator.89"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt16allocator_traitsISaI5TokenEE10deallocateERS1_PS0_m(%"class.std::allocator.89"* dereferenceable(1), %struct.Token*, i64) #6 comdat align 2 {
  %4 = alloca %"class.std::allocator.89"*, align 8
  %5 = alloca %struct.Token*, align 8
  %6 = alloca i64, align 8
  store %"class.std::allocator.89"* %0, %"class.std::allocator.89"** %4, align 8
  store %struct.Token* %1, %struct.Token** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.std::allocator.89"*, %"class.std::allocator.89"** %4, align 8
  %8 = bitcast %"class.std::allocator.89"* %7 to %"class.__gnu_cxx::new_allocator.90"*
  %9 = load %struct.Token*, %struct.Token** %5, align 8
  %10 = load i64, i64* %6, align 8
  call void @_ZN9__gnu_cxx13new_allocatorI5TokenE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator.90"* %8, %struct.Token* %9, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI5TokenE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator.90"*, %struct.Token*, i64) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator.90"*, align 8
  %5 = alloca %struct.Token*, align 8
  %6 = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator.90"* %0, %"class.__gnu_cxx::new_allocator.90"** %4, align 8
  store %struct.Token* %1, %struct.Token** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator.90"*, %"class.__gnu_cxx::new_allocator.90"** %4, align 8
  %8 = load %struct.Token*, %struct.Token** %5, align 8
  %9 = bitcast %struct.Token* %8 to i8*
  call void @_ZdlPv(i8* %9) #3
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #9

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyIPSt6vectorIcSaIcEES2_EvT_S4_RSaIT0_E(%"class.std::vector.86"*, %"class.std::vector.86"*, %"class.std::allocator.83"* dereferenceable(1)) #6 comdat {
  %4 = alloca %"class.std::vector.86"*, align 8
  %5 = alloca %"class.std::vector.86"*, align 8
  %6 = alloca %"class.std::allocator.83"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %4, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %5, align 8
  store %"class.std::allocator.83"* %2, %"class.std::allocator.83"** %6, align 8
  %7 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %8 = load %"class.std::vector.86"*, %"class.std::vector.86"** %5, align 8
  call void @_ZSt8_DestroyIPSt6vectorIcSaIcEEEvT_S4_(%"class.std::vector.86"* %7, %"class.std::vector.86"* %8)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EED2Ev(%"struct.std::_Vector_base"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %2, align 8
  %3 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %5 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %4, i32 0, i32 0
  %6 = load %"class.std::vector.86"*, %"class.std::vector.86"** %5, align 8
  %7 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %7, i32 0, i32 2
  %9 = load %"class.std::vector.86"*, %"class.std::vector.86"** %8, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl", %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %10, i32 0, i32 0
  %12 = load %"class.std::vector.86"*, %"class.std::vector.86"** %11, align 8
  %13 = ptrtoint %"class.std::vector.86"* %9 to i64
  %14 = ptrtoint %"class.std::vector.86"* %12 to i64
  %15 = sub i64 %13, %14
  %16 = sdiv exact i64 %15, 24
  call void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE13_M_deallocateEPS2_m(%"struct.std::_Vector_base"* %3, %"class.std::vector.86"* %6, i64 %16)
  %17 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %3, i32 0, i32 0
  call void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %17) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyIPSt6vectorIcSaIcEEEvT_S4_(%"class.std::vector.86"*, %"class.std::vector.86"*) #6 comdat {
  %3 = alloca %"class.std::vector.86"*, align 8
  %4 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %3, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %4, align 8
  %5 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %6 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  call void @_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIcSaIcEEEEvT_S6_(%"class.std::vector.86"* %5, %"class.std::vector.86"* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Destroy_auxILb0EE9__destroyIPSt6vectorIcSaIcEEEEvT_S6_(%"class.std::vector.86"*, %"class.std::vector.86"*) #6 comdat align 2 {
  %3 = alloca %"class.std::vector.86"*, align 8
  %4 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %3, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %6 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %7 = load %"class.std::vector.86"*, %"class.std::vector.86"** %4, align 8
  %8 = icmp ne %"class.std::vector.86"* %6, %7
  br i1 %8, label %9, label %15

; <label>:9:                                      ; preds = %5
  %10 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %11 = call %"class.std::vector.86"* @_ZSt11__addressofISt6vectorIcSaIcEEEPT_RS3_(%"class.std::vector.86"* dereferenceable(24) %10) #3
  call void @_ZSt8_DestroyISt6vectorIcSaIcEEEvPT_(%"class.std::vector.86"* %11)
  br label %12

; <label>:12:                                     ; preds = %9
  %13 = load %"class.std::vector.86"*, %"class.std::vector.86"** %3, align 8
  %14 = getelementptr inbounds %"class.std::vector.86", %"class.std::vector.86"* %13, i32 1
  store %"class.std::vector.86"* %14, %"class.std::vector.86"** %3, align 8
  br label %5

; <label>:15:                                     ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyISt6vectorIcSaIcEEEvPT_(%"class.std::vector.86"*) #6 comdat {
  %2 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %2, align 8
  %3 = load %"class.std::vector.86"*, %"class.std::vector.86"** %2, align 8
  call void @_ZNSt6vectorIcSaIcEED2Ev(%"class.std::vector.86"* %3) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt6vectorIcSaIcEED2Ev(%"class.std::vector.86"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"class.std::vector.86"*, align 8
  store %"class.std::vector.86"* %0, %"class.std::vector.86"** %2, align 8
  %3 = load %"class.std::vector.86"*, %"class.std::vector.86"** %2, align 8
  %4 = bitcast %"class.std::vector.86"* %3 to %"struct.std::_Vector_base.92"*
  %5 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %5, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast %"class.std::vector.86"* %3 to %"struct.std::_Vector_base.92"*
  %9 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %8, i32 0, i32 0
  %10 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %9, i32 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast %"class.std::vector.86"* %3 to %"struct.std::_Vector_base.92"*
  %13 = call dereferenceable(1) %"class.std::allocator.32"* @_ZNSt12_Vector_baseIcSaIcEE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.92"* %12) #3
  call void @_ZSt8_DestroyIPccEvT_S1_RSaIT0_E(i8* %7, i8* %11, %"class.std::allocator.32"* dereferenceable(1) %13)
  %14 = bitcast %"class.std::vector.86"* %3 to %"struct.std::_Vector_base.92"*
  call void @_ZNSt12_Vector_baseIcSaIcEED2Ev(%"struct.std::_Vector_base.92"* %14) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyIPccEvT_S1_RSaIT0_E(i8*, i8*, %"class.std::allocator.32"* dereferenceable(1)) #6 comdat {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::allocator.32"*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store %"class.std::allocator.32"* %2, %"class.std::allocator.32"** %6, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = load i8*, i8** %5, align 8
  call void @_ZSt8_DestroyIPcEvT_S1_(i8* %7, i8* %8)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseIcSaIcEED2Ev(%"struct.std::_Vector_base.92"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base.92"*, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %2, align 8
  %3 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %3, i32 0, i32 0
  %5 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %4, i32 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %3, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %7, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %3, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl", %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  %13 = ptrtoint i8* %9 to i64
  %14 = ptrtoint i8* %12 to i64
  %15 = sub i64 %13, %14
  call void @_ZNSt12_Vector_baseIcSaIcEE13_M_deallocateEPcm(%"struct.std::_Vector_base.92"* %3, i8* %6, i64 %15)
  %16 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %3, i32 0, i32 0
  call void @_ZNSt12_Vector_baseIcSaIcEE12_Vector_implD2Ev(%"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %16) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZSt8_DestroyIPcEvT_S1_(i8*, i8*) #6 comdat {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i8*, i8** %4, align 8
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIPcEEvT_S3_(i8* %5, i8* %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Destroy_auxILb1EE9__destroyIPcEEvT_S3_(i8*, i8*) #6 comdat align 2 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseIcSaIcEE13_M_deallocateEPcm(%"struct.std::_Vector_base.92"*, i8*, i64) #6 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base.92"*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store %"struct.std::_Vector_base.92"* %0, %"struct.std::_Vector_base.92"** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"struct.std::_Vector_base.92"*, %"struct.std::_Vector_base.92"** %4, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %"struct.std::_Vector_base.92", %"struct.std::_Vector_base.92"* %7, i32 0, i32 0
  %12 = bitcast %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %11 to %"class.std::allocator.32"*
  %13 = load i8*, i8** %5, align 8
  %14 = load i64, i64* %6, align 8
  call void @_ZNSt16allocator_traitsISaIcEE10deallocateERS0_Pcm(%"class.std::allocator.32"* dereferenceable(1) %12, i8* %13, i64 %14)
  br label %15

; <label>:15:                                     ; preds = %10, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseIcSaIcEE12_Vector_implD2Ev(%"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %0, %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"** %2, align 8
  %3 = load %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"*, %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"** %2, align 8
  %4 = bitcast %"struct.std::_Vector_base<char, std::allocator<char> >::_Vector_impl"* %3 to %"class.std::allocator.32"*
  call void @_ZNSaIcED2Ev(%"class.std::allocator.32"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt16allocator_traitsISaIcEE10deallocateERS0_Pcm(%"class.std::allocator.32"* dereferenceable(1), i8*, i64) #6 comdat align 2 {
  %4 = alloca %"class.std::allocator.32"*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store %"class.std::allocator.32"* %0, %"class.std::allocator.32"** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.std::allocator.32"*, %"class.std::allocator.32"** %4, align 8
  %8 = bitcast %"class.std::allocator.32"* %7 to %"class.__gnu_cxx::new_allocator.33"*
  %9 = load i8*, i8** %5, align 8
  %10 = load i64, i64* %6, align 8
  call void @_ZN9__gnu_cxx13new_allocatorIcE10deallocateEPcm(%"class.__gnu_cxx::new_allocator.33"* %8, i8* %9, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorIcE10deallocateEPcm(%"class.__gnu_cxx::new_allocator.33"*, i8*, i64) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator.33"*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator.33"* %0, %"class.__gnu_cxx::new_allocator.33"** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator.33"*, %"class.__gnu_cxx::new_allocator.33"** %4, align 8
  %8 = load i8*, i8** %5, align 8
  call void @_ZdlPv(i8* %8) #3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSaIcED2Ev(%"class.std::allocator.32"*) unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE13_M_deallocateEPS2_m(%"struct.std::_Vector_base"*, %"class.std::vector.86"*, i64) #6 comdat align 2 {
  %4 = alloca %"struct.std::_Vector_base"*, align 8
  %5 = alloca %"class.std::vector.86"*, align 8
  %6 = alloca i64, align 8
  store %"struct.std::_Vector_base"* %0, %"struct.std::_Vector_base"** %4, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %4, align 8
  %8 = load %"class.std::vector.86"*, %"class.std::vector.86"** %5, align 8
  %9 = icmp ne %"class.std::vector.86"* %8, null
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %7, i32 0, i32 0
  %12 = bitcast %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %11 to %"class.std::allocator.83"*
  %13 = load %"class.std::vector.86"*, %"class.std::vector.86"** %5, align 8
  %14 = load i64, i64* %6, align 8
  call void @_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE10deallocateERS3_PS2_m(%"class.std::allocator.83"* dereferenceable(1) %12, %"class.std::vector.86"* %13, i64 %14)
  br label %15

; <label>:15:                                     ; preds = %10, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"*) unnamed_addr #6 comdat align 2 {
  %2 = alloca %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %0, %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"** %2, align 8
  %3 = load %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"*, %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"** %2, align 8
  %4 = bitcast %"struct.std::_Vector_base<std::vector<char, std::allocator<char> >, std::allocator<std::vector<char, std::allocator<char> > > >::_Vector_impl"* %3 to %"class.std::allocator.83"*
  call void @_ZNSaISt6vectorIcSaIcEEED2Ev(%"class.std::allocator.83"* %4) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZNSt16allocator_traitsISaISt6vectorIcSaIcEEEE10deallocateERS3_PS2_m(%"class.std::allocator.83"* dereferenceable(1), %"class.std::vector.86"*, i64) #6 comdat align 2 {
  %4 = alloca %"class.std::allocator.83"*, align 8
  %5 = alloca %"class.std::vector.86"*, align 8
  %6 = alloca i64, align 8
  store %"class.std::allocator.83"* %0, %"class.std::allocator.83"** %4, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.std::allocator.83"*, %"class.std::allocator.83"** %4, align 8
  %8 = bitcast %"class.std::allocator.83"* %7 to %"class.__gnu_cxx::new_allocator.84"*
  %9 = load %"class.std::vector.86"*, %"class.std::vector.86"** %5, align 8
  %10 = load i64, i64* %6, align 8
  call void @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE10deallocateEPS3_m(%"class.__gnu_cxx::new_allocator.84"* %8, %"class.std::vector.86"* %9, i64 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE10deallocateEPS3_m(%"class.__gnu_cxx::new_allocator.84"*, %"class.std::vector.86"*, i64) #6 comdat align 2 {
  %4 = alloca %"class.__gnu_cxx::new_allocator.84"*, align 8
  %5 = alloca %"class.std::vector.86"*, align 8
  %6 = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator.84"* %0, %"class.__gnu_cxx::new_allocator.84"** %4, align 8
  store %"class.std::vector.86"* %1, %"class.std::vector.86"** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load %"class.__gnu_cxx::new_allocator.84"*, %"class.__gnu_cxx::new_allocator.84"** %4, align 8
  %8 = load %"class.std::vector.86"*, %"class.std::vector.86"** %5, align 8
  %9 = bitcast %"class.std::vector.86"* %8 to i8*
  call void @_ZdlPv(i8* %9) #3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7compareEPKc(%"class.std::__cxx11::basic_string"*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @_GLOBAL__sub_I_test_lexer.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { builtin }
attributes #11 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
