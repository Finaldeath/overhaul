//::///////////////////////////////////////////////
//:: Name q1a2_ent_dortrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter - if Drona is in the party - he will
    speak string that she has the key to the footlocker
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
            if (GetTag(oHench) == "x0_hen_dor")
            {
                SetLocalInt(OBJECT_SELF, "nLooted", 1);


                SetLocalInt(oPC, "X1_DornaLootOk", 1);
                AssignCommand(oHench, SpeakStringByStrRef(40377));
            }
        }
    }
}
