// sets Custom Token 500 to the drow word for the PC's race
///Also set First Journal Entry
//act_q2aseer_7

#include "nw_i0_plot"

void main()
{
    object oSeer = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    //Send Imloth outside
    object oImloth = GetObjectByTag("q2arebimloth");
    object oTarget = GetWaypointByTag("wp_q2aimloth_train");

    //Imloth heads out the door to start training his troops in the city core
    object oDoor = GetObjectByTag("at_q2a1door_core");
    AssignCommand(oImloth, PlaySpeakSoundByStrRef(85729));//"I must see about our troops."
    AssignCommand(oImloth, ActionMoveToObject(oDoor, FALSE, 5.0));
    DelayCommand(0.2, SetCommandable(FALSE, oImloth));
    DelayCommand(3.8, SetCommandable(TRUE, oImloth));
    DelayCommand(4.0, AssignCommand(oImloth, ActionDoCommand(JumpToObject(oTarget))));

    //Have Valen and Nathyrra move a little closer.
    object oValen = GetObjectByTag("x2_hen_valen");
    object oNath = GetObjectByTag("x2_hen_nath");
    AssignCommand(oValen, ActionMoveToObject(oSeer, FALSE, 4.0));
    AssignCommand(oNath, ActionMoveToObject(oSeer, FALSE, 6.0));

    AddJournalQuestEntry("q2_Valsharess",5,oPC);

    string sDrowRace;
    int nRace = GetRacialType(oPC);

    if (nRace == RACIAL_TYPE_ELF)
    {
        sDrowRace = GetStringByStrRef(110611);
        //sDrowRace = "darthiir";
    }
    if (nRace == RACIAL_TYPE_DWARF)
    {
        sDrowRace = GetStringByStrRef(110612);
        //sDrowRace = "hargluk";
    }
    if (nRace == RACIAL_TYPE_HALFLING)
    {
        sDrowRace = GetStringByStrRef(110613);
        //sDrowRace = "sakphul";
    }
    if (nRace == RACIAL_TYPE_GNOME)
    {
        sDrowRace = GetStringByStrRef(110614);
        //sDrowRace = "yingil";
    }
    if (nRace == RACIAL_TYPE_HALFELF)
    {
        sDrowRace = GetStringByStrRef(110615);
        //sDrowRace = "tu'rilthiir";
    }
    if (nRace == RACIAL_TYPE_HALFORC)
    {
        sDrowRace = GetStringByStrRef(110616);
        //sDrowRace = "cretok";
    }
    else sDrowRace = GetStringByStrRef(110617);
    //else sDrowRace = "rivvil";

    SetCustomToken(500, sDrowRace);
}
