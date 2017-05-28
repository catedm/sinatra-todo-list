list = [{:name=>"Groceries",
 :todos=>
  [{:name=>"Meat", :completed=>true},
   {:name=>"Milk", :completed=>true},
   {:name=>"Ban", :completed=>true},
   {:name=>"Bananas", :completed=>true}]},
{:name=>"Homework", :todos=>[{:name=>"Meat", :completed=>false}]},
{:name=>"More Homework", :todos=>[]}]

p list.last

def sort_list(list)
  completed_lists = list.select {|todo| todo[:completed]}
end
