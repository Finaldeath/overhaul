//::///////////////////////////////////////////////
//:: Name q1g_ud_sitter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        NPC will find appropriately named chair
        to sit in...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1001)
    {

        if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            object oChair = GetObjectByTag("q1gchair" + GetStringRight(GetTag(OBJECT_SELF), 1));
            AssignCommand(OBJECT_SELF, ActionSit(oChair));
        }

    }

}

