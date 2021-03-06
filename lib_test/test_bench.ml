open Core.Std
open Core_bench.Std

let main () =
  let arr1 = Array.create ~len:256 None in
  let t1 = Bench.Test.create ~name:"SettingNone" (fun () ->
    for i = 0 to Array.length arr1 - 1 do
      arr1.(i) <- None;
    done) in
  let arr2 = Array.create ~len:1000 0 in
  let t2 = Bench.Test.create ~name:"SettingInt" (fun () ->
    for i = 0 to Array.length arr2 - 1 do
      arr2.(i) <- 10;
    done) in
  let t3_1 = Bench.Test.create ~name:"ArrayCreateInt1" (fun () ->
    ignore (Array.create ~len:200 0);
  ) in
  let t3_2 = Bench.Test.create ~name:"ArrayCreateInt2" (fun () ->
    ignore (Array.create ~len:300 0);
  ) in
  let t4 = Bench.Test.create ~name:"Id" (fun () -> ()) in
  let t5 = Bench.Test.create ~name:"TimeNow" (fun () ->
    ignore (Time.now ())) in
  Command.run (Bench.make_command [t1; t2; t3_1; t3_2; t4; t5])


let () = main ()







