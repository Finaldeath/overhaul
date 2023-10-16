//::///////////////////////////////////////////////
//:: Name  q2c2_chaincheck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If the chain being attached is the same colour
     as the pedastal (check the right 3 letters of
     the pedastal's tag against the module variable
     szAttachChain), then the chain will successfully
     attach - so return false, otherwise return true
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 6/02
//:://////////////////////////////////////////////

int StartingConditional()
{


    if (GetLocalString(GetModule(),"szAttachChain") == GetStringRight(GetTag(OBJECT_SELF), 3))
        return FALSE;
    return TRUE;
}
