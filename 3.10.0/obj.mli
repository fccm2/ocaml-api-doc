(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../LICENSE.     *)
(*                                                                     *)
(***********************************************************************)

(* $Id: obj.mli,v 1.29 2005/10/25 18:34:07 doligez Exp $ *)

(** Operations on internal representations of values.

   Not for the casual user.
*)

type t

external repr : 'a -> t = "%identity"
external obj : t -> 'a = "%identity"
external magic : 'a -> 'b = "%identity"
external is_block : t -> bool = "caml_obj_is_block"
external is_int : t -> bool = "%obj_is_int"
external tag : t -> int = "caml_obj_tag"
external set_tag : t -> int -> unit = "caml_obj_set_tag"
external size : t -> int = "%obj_size"
external truncate : t -> int -> unit = "caml_obj_truncate"
external field : t -> int -> t = "%obj_field"
external set_field : t -> int -> t -> unit = "%obj_set_field"
external new_block : int -> int -> t = "caml_obj_block"
external dup : t -> t = "caml_obj_dup"

val lazy_tag : int
val closure_tag : int
val object_tag : int
val infix_tag : int
val forward_tag : int
val no_scan_tag : int
val abstract_tag : int
val string_tag : int
val double_tag : int
val double_array_tag : int
val custom_tag : int
val final_tag : int  (* DEPRECATED *)

val int_tag : int
val out_of_heap_tag : int

(** The following two functions are deprecated.  Use module {!Marshal}
    instead. *)

val marshal : t -> string
val unmarshal : string -> int -> t * int
