pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~elevator.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~elevator.adb");

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E084 : Short_Integer; pragma Import (Ada, E084, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__fat_flt_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__fat_llf_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "ada__containers_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "ada__io_exceptions_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ada__numerics_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__tags_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__streams_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "interfaces__c_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__finalization_root_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "ada__finalization_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__storage_pools_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "system__finalization_masters_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system__storage_pools__subpools_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__task_info_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__calendar__delays_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "system__pool_global_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "system__file_control_block_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "system__file_io_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "system__random_seed_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "system__tasking__initialization_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "system__tasking__protected_objects_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__real_time_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__text_io_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "system__tasking__protected_objects__entries_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "system__tasking__queuing_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "system__tasking__stages_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "button_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "floors_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "cart_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "nt_console_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E190 := E190 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "cart__finalize_spec");
      begin
         F1;
      end;
      E225 := E225 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "floors__finalize_spec");
      begin
         F2;
      end;
      E209 := E209 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F3;
      end;
      E059 := E059 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      E089 := E089 - 1;
      E103 := E103 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E076 := E076 - 1;
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__file_control_block__finalize_spec");
      begin
         E087 := E087 - 1;
         F6;
      end;
      E099 := E099 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__pool_global__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__storage_pools__subpools__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__finalization_masters__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, True, False, True, True, False, False, True, 
           False, False, True, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           True, True, True, True, True, False, True, False, 
           True, False, False, False, False, False, True, False, 
           True, False, True, True, False, False, True, False, 
           False, False, False, True, False, True, False, True, 
           True, True, False, False, True, False, False, True, 
           False, True, True, False, True, True, True, False, 
           True, False, False, False, False, True, True, True, 
           False, False, False),
         Count => (0, 0, 0, 0, 2, 2, 2, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Fat_Flt'Elab_Spec;
      E124 := E124 + 1;
      System.Fat_Llf'Elab_Spec;
      E112 := E112 + 1;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Containers'Elab_Spec;
      E221 := E221 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E062 := E062 + 1;
      Ada.Numerics'Elab_Spec;
      E145 := E145 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E061 := E061 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      System.Finalization_Root'Elab_Spec;
      E080 := E080 + 1;
      Ada.Finalization'Elab_Spec;
      E078 := E078 + 1;
      System.Storage_Pools'Elab_Spec;
      E097 := E097 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Task_Info'Elab_Spec;
      E174 := E174 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E053 := E053 + 1;
      System.Pool_Global'Elab_Spec;
      E099 := E099 + 1;
      System.File_Control_Block'Elab_Spec;
      E087 := E087 + 1;
      System.Random_Seed'Elab_Body;
      E151 := E151 + 1;
      System.File_Io'Elab_Body;
      E076 := E076 + 1;
      E103 := E103 + 1;
      System.Finalization_Masters'Elab_Body;
      E089 := E089 + 1;
      E049 := E049 + 1;
      Ada.Tags'Elab_Body;
      E064 := E064 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E084 := E084 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      System.Tasking.Initialization'Elab_Body;
      E201 := E201 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E207 := E207 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E153 := E153 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E059 := E059 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E209 := E209 + 1;
      System.Tasking.Queuing'Elab_Body;
      E213 := E213 + 1;
      System.Tasking.Stages'Elab_Body;
      E219 := E219 + 1;
      E223 := E223 + 1;
      Floors'Elab_Spec;
      E225 := E225 + 1;
      Cart'Elab_Spec;
      Nt_Console'Elab_Body;
      E193 := E193 + 1;
      Cart'Elab_Body;
      E190 := E190 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_elevator");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   ./button.o
   --   ./floors.o
   --   ./nt_console.o
   --   ./cart.o
   --   ./elevator.o
   --   -L./
   --   -L/usr/lib/gcc/x86_64-linux-gnu/4.9/adalib/
   --   -luser32
   --   -shared
   --   -lgnarl-4.9
   --   -lgnat-4.9
   --   -lpthread
--  END Object file/option list   

end ada_main;
