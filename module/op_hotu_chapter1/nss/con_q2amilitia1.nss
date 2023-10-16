//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Guards should give guard dialog to other guards
    and citizen dialog with citizens.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 30/02
//:://////////////////////////////////////////////

int StartingConditional()
{

    if (GetStringRight(GetTag(GetLocalObject(OBJECT_SELF, "X2_L_LASTPERSONISPOKETO")), 5) == "guard")
        return TRUE;

    return FALSE;
}
