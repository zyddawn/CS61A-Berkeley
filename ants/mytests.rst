This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

Suite 1

	>>> from ants import *
	Case Example
		>>> x = 5
		>>> x
		5
                >>> from ants import *
                >>> hive, layout = Hive(AssaultPlan()), dry_layout
                >>> dimensions = (1, 9)
                >>> colony = AntColony(None, hive, ant_types(), layout, dimensions)
                >>> # Testing if ScubaThrower is watersafe
                >>> water = Water('Water')
                >>> ant = ScubaThrower()
                >>> water.add_insect(ant)
                >>> ant.place is water
                True
                >>> ant.watersafe
                True
                >>> ant.name
                'Scuba'
                >>> ant.armor
                1
                >>> b = Bee(3)
                >>> water.add_insect(b)
                >>> b.sting(ant)
                >>> ant.armor
                1
                >>> new_ant = ScubaThrower()
                >>> new_ant.armor
                1
                >>> place = Place("new p")
                >>> place.add_insect(new_ant)
                >>> c = Bee(2)
                >>> place.add_insect(c)
                >>> c.sting(new_ant)
                >>> new_ant.armor
                0




