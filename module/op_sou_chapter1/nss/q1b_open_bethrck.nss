//::///////////////////////////////////////////////
//:: Name q1b_open_chicktr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Put a script on it that watches for the module
  global "q1b_trough" to equal 1. When that occurs,
  create an amethyst in the trough.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 26/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "q1b_Bethsheva_Secret") == 1 && GetLocalInt(OBJECT_SELF, "nCreated") !=1)
    {
        CreateItemOnObject("q1wolfring");
        SetLocalInt(OBJECT_SELF, "nCreated", 1);
    }

}
