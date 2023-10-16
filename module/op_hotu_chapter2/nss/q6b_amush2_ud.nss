// Handling the creation of the drow leaving the queen's cave.

void ExitDrow(string sBP)
{
    object oExit = GetWaypointByTag("q6a_wp_drow_exit");
    object oMove1 = GetWaypointByTag("q6a_wp_drow_move1");
    object oMove2 = GetWaypointByTag("q6a_wp_drow_move2");
    object oMove3 = GetWaypointByTag("q6a_wp_drow_move3");

    object oDrow = CreateObject(OBJECT_TYPE_CREATURE, sBP, GetLocation(oExit));
    AssignCommand(oDrow, ActionMoveToObject(oMove1));
    AssignCommand(oDrow, ActionWait(3.0));
    AssignCommand(oDrow, ActionMoveToObject(oMove2));
    AssignCommand(oDrow, ActionMoveToObject(oMove3));

}

void ExitAllDrow()
{

    // The drow are coming out in a few waves:
    // wave 1: 2 drow guards and a red sister rogue.
    // wave 2: Sabal a 2 red sister warriors
    // wave 3: 3 drow guards
    // wave 4: 2 drow guards and a red sister cleric.

    ExitDrow("q6_DrowWarrior");
    ExitDrow("q6_RSRogue");
    ExitDrow("q6_DrowWarrior");

    DelayCommand(5.0, ExitDrow("q6_DrowWarrior"));
    DelayCommand(5.0, ExitDrow("q6_sabal"));
    DelayCommand(5.0, ExitDrow("q6_DrowWarrior"));

    DelayCommand(10.0, ExitDrow("q6_DrowWarrior"));
    DelayCommand(10.0, ExitDrow("q6_DrowWarrior"));
    DelayCommand(10.0, ExitDrow("q6_DrowWarrior"));

    DelayCommand(15.0, ExitDrow("q6_DrowWarrior"));
    DelayCommand(15.0, ExitDrow("q6_RSCleric"));
    DelayCommand(15.0, ExitDrow("q6_DrowWarrior"));

}

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_EXIT_DROW_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_EXIT_DROW_ONCE", 1);
        SetLocalInt(GetArea(OBJECT_SELF), "PC_AMBUSH_ACTIVE", 0);
        ExitAllDrow();

    }
}
