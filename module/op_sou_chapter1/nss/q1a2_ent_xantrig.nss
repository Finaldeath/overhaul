//::///////////////////////////////////////////////
//:: Name q1a2_ent_xantrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter - if Xanos is in the party - he will
    'loot' his own chest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 27/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nLooted") != 1)
    {

        object oPC = GetEnteringObject();
        object oHench = GetHenchman(oPC);
        if (GetIsObjectValid(oHench) != FALSE)
        {
            if (GetTag(oHench) == "x0_hen_xan")
            {
                SetLocalInt(OBJECT_SELF, "nLooted", 1);
                SetLocalInt(oPC, "X1_XanosLootOk", 1);
                AssignCommand(oHench, SpeakStringByStrRef(40377));
            }
        }
    }
}
