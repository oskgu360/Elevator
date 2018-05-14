pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 4.9.3" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_elevator" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#db783bd2#;
   pragma Export (C, u00001, "elevatorB");
   u00002 : constant Version_32 := 16#a964624f#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#c15e0628#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#65712768#;
   pragma Export (C, u00005, "ada__calendarB");
   u00006 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00006, "ada__calendarS");
   u00007 : constant Version_32 := 16#e9502879#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#e1be92cd#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#51ba2b93#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#909606f8#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#90249111#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#77a147eb#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#6144caac#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#65bb1402#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#3ba8257b#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#643ddf46#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#3b455e78#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#bde7db15#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#1e9bfaf9#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#7ff7f3a3#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#6ca6d92c#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#14e622fb#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#b6b84985#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#9e373b74#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#a83a37b3#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#cd9019cf#;
   pragma Export (C, u00030, "system__exceptions__machineS");
   u00031 : constant Version_32 := 16#a2eb6533#;
   pragma Export (C, u00031, "system__exceptions_debugB");
   u00032 : constant Version_32 := 16#6b2380a9#;
   pragma Export (C, u00032, "system__exceptions_debugS");
   u00033 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00033, "system__img_intB");
   u00034 : constant Version_32 := 16#92ff71d3#;
   pragma Export (C, u00034, "system__img_intS");
   u00035 : constant Version_32 := 16#ff5c7695#;
   pragma Export (C, u00035, "system__tracebackB");
   u00036 : constant Version_32 := 16#b8200e4c#;
   pragma Export (C, u00036, "system__tracebackS");
   u00037 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00037, "system__wch_conB");
   u00038 : constant Version_32 := 16#8b59b3c3#;
   pragma Export (C, u00038, "system__wch_conS");
   u00039 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00039, "system__wch_stwB");
   u00040 : constant Version_32 := 16#a6489fc2#;
   pragma Export (C, u00040, "system__wch_stwS");
   u00041 : constant Version_32 := 16#9b29844d#;
   pragma Export (C, u00041, "system__wch_cnvB");
   u00042 : constant Version_32 := 16#84ee0930#;
   pragma Export (C, u00042, "system__wch_cnvS");
   u00043 : constant Version_32 := 16#69adb1b9#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00044, "system__wch_jisB");
   u00045 : constant Version_32 := 16#049e1011#;
   pragma Export (C, u00045, "system__wch_jisS");
   u00046 : constant Version_32 := 16#8cb17bcd#;
   pragma Export (C, u00046, "system__traceback_entriesB");
   u00047 : constant Version_32 := 16#2535f183#;
   pragma Export (C, u00047, "system__traceback_entriesS");
   u00048 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00048, "interfaces__cB");
   u00049 : constant Version_32 := 16#96001448#;
   pragma Export (C, u00049, "interfaces__cS");
   u00050 : constant Version_32 := 16#22d03640#;
   pragma Export (C, u00050, "system__os_primitivesB");
   u00051 : constant Version_32 := 16#20f51d38#;
   pragma Export (C, u00051, "system__os_primitivesS");
   u00052 : constant Version_32 := 16#d6a2decd#;
   pragma Export (C, u00052, "ada__calendar__delaysB");
   u00053 : constant Version_32 := 16#474dd4b1#;
   pragma Export (C, u00053, "ada__calendar__delaysS");
   u00054 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00054, "system__tracesB");
   u00055 : constant Version_32 := 16#6239f9bb#;
   pragma Export (C, u00055, "system__tracesS");
   u00056 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00056, "ada__float_text_ioB");
   u00057 : constant Version_32 := 16#e61b3c6c#;
   pragma Export (C, u00057, "ada__float_text_ioS");
   u00058 : constant Version_32 := 16#9a3f0a9b#;
   pragma Export (C, u00058, "ada__text_ioB");
   u00059 : constant Version_32 := 16#27578d68#;
   pragma Export (C, u00059, "ada__text_ioS");
   u00060 : constant Version_32 := 16#1b5643e2#;
   pragma Export (C, u00060, "ada__streamsB");
   u00061 : constant Version_32 := 16#2564c958#;
   pragma Export (C, u00061, "ada__streamsS");
   u00062 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00062, "ada__io_exceptionsS");
   u00063 : constant Version_32 := 16#08ba48f3#;
   pragma Export (C, u00063, "ada__tagsB");
   u00064 : constant Version_32 := 16#ee1e5cdd#;
   pragma Export (C, u00064, "ada__tagsS");
   u00065 : constant Version_32 := 16#c12203be#;
   pragma Export (C, u00065, "system__unsigned_typesS");
   u00066 : constant Version_32 := 16#1e25d3f1#;
   pragma Export (C, u00066, "system__val_lluB");
   u00067 : constant Version_32 := 16#bbd054cc#;
   pragma Export (C, u00067, "system__val_lluS");
   u00068 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00068, "system__val_utilB");
   u00069 : constant Version_32 := 16#3c8427ef#;
   pragma Export (C, u00069, "system__val_utilS");
   u00070 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00070, "system__case_utilB");
   u00071 : constant Version_32 := 16#b42df8c6#;
   pragma Export (C, u00071, "system__case_utilS");
   u00072 : constant Version_32 := 16#e0b7a7e8#;
   pragma Export (C, u00072, "interfaces__c_streamsB");
   u00073 : constant Version_32 := 16#6c8b8ac5#;
   pragma Export (C, u00073, "interfaces__c_streamsS");
   u00074 : constant Version_32 := 16#bfa64d6c#;
   pragma Export (C, u00074, "system__crtlS");
   u00075 : constant Version_32 := 16#ec6e1273#;
   pragma Export (C, u00075, "system__file_ioB");
   u00076 : constant Version_32 := 16#0165f036#;
   pragma Export (C, u00076, "system__file_ioS");
   u00077 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00077, "ada__finalizationB");
   u00078 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00078, "ada__finalizationS");
   u00079 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00079, "system__finalization_rootB");
   u00080 : constant Version_32 := 16#dfd6e281#;
   pragma Export (C, u00080, "system__finalization_rootS");
   u00081 : constant Version_32 := 16#d0432c8d#;
   pragma Export (C, u00081, "system__img_enum_newB");
   u00082 : constant Version_32 := 16#f16897d1#;
   pragma Export (C, u00082, "system__img_enum_newS");
   u00083 : constant Version_32 := 16#eec8f81b#;
   pragma Export (C, u00083, "system__os_libB");
   u00084 : constant Version_32 := 16#fc501b71#;
   pragma Export (C, u00084, "system__os_libS");
   u00085 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00085, "system__stringsB");
   u00086 : constant Version_32 := 16#ee9b8077#;
   pragma Export (C, u00086, "system__stringsS");
   u00087 : constant Version_32 := 16#da3df06e#;
   pragma Export (C, u00087, "system__file_control_blockS");
   u00088 : constant Version_32 := 16#1f8826cb#;
   pragma Export (C, u00088, "system__finalization_mastersB");
   u00089 : constant Version_32 := 16#df27fd08#;
   pragma Export (C, u00089, "system__finalization_mastersS");
   u00090 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00090, "system__address_imageB");
   u00091 : constant Version_32 := 16#31c80c2b#;
   pragma Export (C, u00091, "system__address_imageS");
   u00092 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00092, "system__img_boolB");
   u00093 : constant Version_32 := 16#65fde0fa#;
   pragma Export (C, u00093, "system__img_boolS");
   u00094 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00094, "system__ioB");
   u00095 : constant Version_32 := 16#0e66665e#;
   pragma Export (C, u00095, "system__ioS");
   u00096 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00096, "system__storage_poolsB");
   u00097 : constant Version_32 := 16#5e6a53cc#;
   pragma Export (C, u00097, "system__storage_poolsS");
   u00098 : constant Version_32 := 16#e34550ca#;
   pragma Export (C, u00098, "system__pool_globalB");
   u00099 : constant Version_32 := 16#c88d2d16#;
   pragma Export (C, u00099, "system__pool_globalS");
   u00100 : constant Version_32 := 16#6810466c#;
   pragma Export (C, u00100, "system__memoryB");
   u00101 : constant Version_32 := 16#c959f725#;
   pragma Export (C, u00101, "system__memoryS");
   u00102 : constant Version_32 := 16#1220f12d#;
   pragma Export (C, u00102, "system__storage_pools__subpoolsB");
   u00103 : constant Version_32 := 16#b0e8cddc#;
   pragma Export (C, u00103, "system__storage_pools__subpoolsS");
   u00104 : constant Version_32 := 16#aba9f469#;
   pragma Export (C, u00104, "system__storage_pools__subpools__finalizationB");
   u00105 : constant Version_32 := 16#9662cb63#;
   pragma Export (C, u00105, "system__storage_pools__subpools__finalizationS");
   u00106 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00106, "ada__text_io__float_auxB");
   u00107 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00107, "ada__text_io__float_auxS");
   u00108 : constant Version_32 := 16#cd6ba629#;
   pragma Export (C, u00108, "ada__text_io__generic_auxB");
   u00109 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00109, "ada__text_io__generic_auxS");
   u00110 : constant Version_32 := 16#56e74f1a#;
   pragma Export (C, u00110, "system__img_realB");
   u00111 : constant Version_32 := 16#578cc0f3#;
   pragma Export (C, u00111, "system__img_realS");
   u00112 : constant Version_32 := 16#4f1f4f21#;
   pragma Export (C, u00112, "system__fat_llfS");
   u00113 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00113, "system__float_controlB");
   u00114 : constant Version_32 := 16#70d8d22d#;
   pragma Export (C, u00114, "system__float_controlS");
   u00115 : constant Version_32 := 16#3da6be5a#;
   pragma Export (C, u00115, "system__img_lluB");
   u00116 : constant Version_32 := 16#88eb037d#;
   pragma Export (C, u00116, "system__img_lluS");
   u00117 : constant Version_32 := 16#22ab03a2#;
   pragma Export (C, u00117, "system__img_unsB");
   u00118 : constant Version_32 := 16#5ed63f49#;
   pragma Export (C, u00118, "system__img_unsS");
   u00119 : constant Version_32 := 16#c054f766#;
   pragma Export (C, u00119, "system__powten_tableS");
   u00120 : constant Version_32 := 16#8ff77155#;
   pragma Export (C, u00120, "system__val_realB");
   u00121 : constant Version_32 := 16#6e0de600#;
   pragma Export (C, u00121, "system__val_realS");
   u00122 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00122, "system__exn_llfB");
   u00123 : constant Version_32 := 16#11a08ffe#;
   pragma Export (C, u00123, "system__exn_llfS");
   u00124 : constant Version_32 := 16#13fde8c6#;
   pragma Export (C, u00124, "system__fat_fltS");
   u00125 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00125, "ada__integer_text_ioB");
   u00126 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00126, "ada__integer_text_ioS");
   u00127 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00127, "ada__text_io__integer_auxB");
   u00128 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00128, "ada__text_io__integer_auxS");
   u00129 : constant Version_32 := 16#d48b4eeb#;
   pragma Export (C, u00129, "system__img_biuB");
   u00130 : constant Version_32 := 16#07008bf3#;
   pragma Export (C, u00130, "system__img_biuS");
   u00131 : constant Version_32 := 16#2b864520#;
   pragma Export (C, u00131, "system__img_llbB");
   u00132 : constant Version_32 := 16#46c79b0d#;
   pragma Export (C, u00132, "system__img_llbS");
   u00133 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00133, "system__img_lliB");
   u00134 : constant Version_32 := 16#816bc4c0#;
   pragma Export (C, u00134, "system__img_lliS");
   u00135 : constant Version_32 := 16#c2d63ebb#;
   pragma Export (C, u00135, "system__img_llwB");
   u00136 : constant Version_32 := 16#efabb89b#;
   pragma Export (C, u00136, "system__img_llwS");
   u00137 : constant Version_32 := 16#8ed53197#;
   pragma Export (C, u00137, "system__img_wiuB");
   u00138 : constant Version_32 := 16#69410c61#;
   pragma Export (C, u00138, "system__img_wiuS");
   u00139 : constant Version_32 := 16#f8f38c17#;
   pragma Export (C, u00139, "system__val_intB");
   u00140 : constant Version_32 := 16#d881bb2e#;
   pragma Export (C, u00140, "system__val_intS");
   u00141 : constant Version_32 := 16#4266b2a8#;
   pragma Export (C, u00141, "system__val_unsB");
   u00142 : constant Version_32 := 16#d18aee85#;
   pragma Export (C, u00142, "system__val_unsS");
   u00143 : constant Version_32 := 16#e892b88e#;
   pragma Export (C, u00143, "system__val_lliB");
   u00144 : constant Version_32 := 16#0a0077b1#;
   pragma Export (C, u00144, "system__val_lliS");
   u00145 : constant Version_32 := 16#84ad4a42#;
   pragma Export (C, u00145, "ada__numericsS");
   u00146 : constant Version_32 := 16#ac5daf3d#;
   pragma Export (C, u00146, "ada__numerics__float_randomB");
   u00147 : constant Version_32 := 16#ac27f55b#;
   pragma Export (C, u00147, "ada__numerics__float_randomS");
   u00148 : constant Version_32 := 16#fb675641#;
   pragma Export (C, u00148, "system__random_numbersB");
   u00149 : constant Version_32 := 16#a73a1fa2#;
   pragma Export (C, u00149, "system__random_numbersS");
   u00150 : constant Version_32 := 16#7d397bc7#;
   pragma Export (C, u00150, "system__random_seedB");
   u00151 : constant Version_32 := 16#f82c5b9b#;
   pragma Export (C, u00151, "system__random_seedS");
   u00152 : constant Version_32 := 16#8db46565#;
   pragma Export (C, u00152, "ada__real_timeB");
   u00153 : constant Version_32 := 16#41de19c7#;
   pragma Export (C, u00153, "ada__real_timeS");
   u00154 : constant Version_32 := 16#08b07a85#;
   pragma Export (C, u00154, "system__arith_64B");
   u00155 : constant Version_32 := 16#b9c4855a#;
   pragma Export (C, u00155, "system__arith_64S");
   u00156 : constant Version_32 := 16#e3a166b3#;
   pragma Export (C, u00156, "system__taskingB");
   u00157 : constant Version_32 := 16#a2cc2493#;
   pragma Export (C, u00157, "system__taskingS");
   u00158 : constant Version_32 := 16#dcd399aa#;
   pragma Export (C, u00158, "system__task_primitivesS");
   u00159 : constant Version_32 := 16#2ad85054#;
   pragma Export (C, u00159, "system__os_interfaceB");
   u00160 : constant Version_32 := 16#9b85d81a#;
   pragma Export (C, u00160, "system__os_interfaceS");
   u00161 : constant Version_32 := 16#9f2af92f#;
   pragma Export (C, u00161, "system__linuxS");
   u00162 : constant Version_32 := 16#604031aa#;
   pragma Export (C, u00162, "system__os_constantsS");
   u00163 : constant Version_32 := 16#d18cfba2#;
   pragma Export (C, u00163, "system__task_primitives__operationsB");
   u00164 : constant Version_32 := 16#c52b4255#;
   pragma Export (C, u00164, "system__task_primitives__operationsS");
   u00165 : constant Version_32 := 16#431dd077#;
   pragma Export (C, u00165, "system__bit_opsB");
   u00166 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00166, "system__bit_opsS");
   u00167 : constant Version_32 := 16#903909a4#;
   pragma Export (C, u00167, "system__interrupt_managementB");
   u00168 : constant Version_32 := 16#dabe819f#;
   pragma Export (C, u00168, "system__interrupt_managementS");
   u00169 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00169, "system__multiprocessorsB");
   u00170 : constant Version_32 := 16#a8880e62#;
   pragma Export (C, u00170, "system__multiprocessorsS");
   u00171 : constant Version_32 := 16#395dd3e7#;
   pragma Export (C, u00171, "system__stack_checking__operationsB");
   u00172 : constant Version_32 := 16#64c2cb2b#;
   pragma Export (C, u00172, "system__stack_checking__operationsS");
   u00173 : constant Version_32 := 16#3d54d5f6#;
   pragma Export (C, u00173, "system__task_infoB");
   u00174 : constant Version_32 := 16#e814e751#;
   pragma Export (C, u00174, "system__task_infoS");
   u00175 : constant Version_32 := 16#74372fee#;
   pragma Export (C, u00175, "system__tasking__debugB");
   u00176 : constant Version_32 := 16#46dc5128#;
   pragma Export (C, u00176, "system__tasking__debugS");
   u00177 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00177, "system__concat_2B");
   u00178 : constant Version_32 := 16#928446c1#;
   pragma Export (C, u00178, "system__concat_2S");
   u00179 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00179, "system__concat_3B");
   u00180 : constant Version_32 := 16#9b54cdb4#;
   pragma Export (C, u00180, "system__concat_3S");
   u00181 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00181, "system__concat_6B");
   u00182 : constant Version_32 := 16#42e3bca3#;
   pragma Export (C, u00182, "system__concat_6S");
   u00183 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00183, "system__concat_5B");
   u00184 : constant Version_32 := 16#177ad23f#;
   pragma Export (C, u00184, "system__concat_5S");
   u00185 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00185, "system__concat_4B");
   u00186 : constant Version_32 := 16#ee40ba31#;
   pragma Export (C, u00186, "system__concat_4S");
   u00187 : constant Version_32 := 16#4e9d8c2e#;
   pragma Export (C, u00187, "system__stack_usageB");
   u00188 : constant Version_32 := 16#09222097#;
   pragma Export (C, u00188, "system__stack_usageS");
   u00189 : constant Version_32 := 16#2e0b2409#;
   pragma Export (C, u00189, "cartB");
   u00190 : constant Version_32 := 16#c64c48e2#;
   pragma Export (C, u00190, "cartS");
   u00191 : constant Version_32 := 16#f4d84941#;
   pragma Export (C, u00191, "calendarS");
   u00192 : constant Version_32 := 16#d0392659#;
   pragma Export (C, u00192, "nt_consoleB");
   u00193 : constant Version_32 := 16#92484855#;
   pragma Export (C, u00193, "nt_consoleS");
   u00194 : constant Version_32 := 16#a56b69a7#;
   pragma Export (C, u00194, "system__tasking__rendezvousB");
   u00195 : constant Version_32 := 16#d7d33e30#;
   pragma Export (C, u00195, "system__tasking__rendezvousS");
   u00196 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00196, "system__restrictionsB");
   u00197 : constant Version_32 := 16#7706b620#;
   pragma Export (C, u00197, "system__restrictionsS");
   u00198 : constant Version_32 := 16#e57c2b4c#;
   pragma Export (C, u00198, "system__tasking__entry_callsB");
   u00199 : constant Version_32 := 16#e5160f9e#;
   pragma Export (C, u00199, "system__tasking__entry_callsS");
   u00200 : constant Version_32 := 16#10015ee5#;
   pragma Export (C, u00200, "system__tasking__initializationB");
   u00201 : constant Version_32 := 16#f20398cb#;
   pragma Export (C, u00201, "system__tasking__initializationS");
   u00202 : constant Version_32 := 16#a6a45076#;
   pragma Export (C, u00202, "system__soft_links__taskingB");
   u00203 : constant Version_32 := 16#e47ef8be#;
   pragma Export (C, u00203, "system__soft_links__taskingS");
   u00204 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00204, "ada__exceptions__is_null_occurrenceB");
   u00205 : constant Version_32 := 16#30a405b9#;
   pragma Export (C, u00205, "ada__exceptions__is_null_occurrenceS");
   u00206 : constant Version_32 := 16#65fc3619#;
   pragma Export (C, u00206, "system__tasking__protected_objectsB");
   u00207 : constant Version_32 := 16#6fa056d1#;
   pragma Export (C, u00207, "system__tasking__protected_objectsS");
   u00208 : constant Version_32 := 16#f4f232d3#;
   pragma Export (C, u00208, "system__tasking__protected_objects__entriesB");
   u00209 : constant Version_32 := 16#4d64e3b6#;
   pragma Export (C, u00209, "system__tasking__protected_objects__entriesS");
   u00210 : constant Version_32 := 16#3852d274#;
   pragma Export (C, u00210, "system__tasking__protected_objects__operationsB");
   u00211 : constant Version_32 := 16#415d7a1b#;
   pragma Export (C, u00211, "system__tasking__protected_objects__operationsS");
   u00212 : constant Version_32 := 16#a5fc5d01#;
   pragma Export (C, u00212, "system__tasking__queuingB");
   u00213 : constant Version_32 := 16#3d02e133#;
   pragma Export (C, u00213, "system__tasking__queuingS");
   u00214 : constant Version_32 := 16#cfd258fe#;
   pragma Export (C, u00214, "system__tasking__utilitiesB");
   u00215 : constant Version_32 := 16#39283e2c#;
   pragma Export (C, u00215, "system__tasking__utilitiesS");
   u00216 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00216, "system__traces__taskingB");
   u00217 : constant Version_32 := 16#33a47127#;
   pragma Export (C, u00217, "system__traces__taskingS");
   u00218 : constant Version_32 := 16#f8794da0#;
   pragma Export (C, u00218, "system__tasking__stagesB");
   u00219 : constant Version_32 := 16#a64e9461#;
   pragma Export (C, u00219, "system__tasking__stagesS");
   u00220 : constant Version_32 := 16#7dbbd31d#;
   pragma Export (C, u00220, "text_ioS");
   u00221 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00221, "ada__containersS");
   u00222 : constant Version_32 := 16#8e846230#;
   pragma Export (C, u00222, "buttonB");
   u00223 : constant Version_32 := 16#785c4211#;
   pragma Export (C, u00223, "buttonS");
   u00224 : constant Version_32 := 16#48389312#;
   pragma Export (C, u00224, "floorsB");
   u00225 : constant Version_32 := 16#c0c5a11e#;
   pragma Export (C, u00225, "floorsS");
   u00226 : constant Version_32 := 16#ffe20862#;
   pragma Export (C, u00226, "system__stream_attributesB");
   u00227 : constant Version_32 := 16#e5402c91#;
   pragma Export (C, u00227, "system__stream_attributesS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.arith_64%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_real%s
   --  system.io%s
   --  system.io%b
   --  system.multiprocessors%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_checking.operations%s
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.arith_64%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  system.soft_links%s
   --  system.stack_checking.operations%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.multiprocessors%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.linux%s
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.interrupt_management%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.interrupt_management%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%s
   --  system.task_primitives.operations%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  calendar%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.random_numbers%s
   --  ada.numerics.float_random%s
   --  ada.numerics.float_random%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.tasking.debug%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.random_numbers%b
   --  system.address_image%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.utilities%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.float_aux%s
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%b
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.rendezvous%b
   --  system.tasking.entry_calls%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  text_io%s
   --  button%s
   --  button%b
   --  floors%s
   --  floors%b
   --  cart%s
   --  nt_console%s
   --  nt_console%b
   --  cart%b
   --  elevator%b
   --  END ELABORATION ORDER


end ada_main;
