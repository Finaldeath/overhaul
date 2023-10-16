//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that PC spoke to Piper once, but did not persuade
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 13, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "X1_PIPERSPEAK", 10);

    object oTrigger = GetObjectByTag("PopUp34");
    if (GetIsObjectValid(oTrigger))
    {
        DestroyObject(oTrigger);
    }
}
