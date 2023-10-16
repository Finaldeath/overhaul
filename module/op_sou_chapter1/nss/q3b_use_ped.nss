//::///////////////////////////////////////////////
//:: Name q3b_use_ped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On used of a pedestal, floating text string on the PC
    a part of the poem..
    Ped 1: "Getting around can be quite tough." #40520
    Ped 2: "The smallest spell is often enough." #40521
    Ped 3: "Four chances you have, then your luck is broken." #40522
    Ped 4: "Cast the right spell to get the token." #40523
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 10/03
//:://////////////////////////////////////////////

void main()
{
    //once for each pedestal - add to the string being spoke..
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        SetLocalInt(GetArea(OBJECT_SELF), "nPedPoem", GetLocalInt(GetArea(OBJECT_SELF), "nPedPoem") + 1);

    }
    int nString = GetLocalInt(GetArea(OBJECT_SELF), "nPedPoem");

    switch (nString)
    {
        case 1: SpeakStringByStrRef(40520);
                break;
        case 2: SpeakStringByStrRef(40521);
                break;
        case 3: SpeakStringByStrRef(40522);
                break;
        case 4: SpeakStringByStrRef(40523);
                break;
    }

}
