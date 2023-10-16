//::///////////////////////////////////////////////
//:: Name hx_scorch_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will keep the scorch marks around for
     only a brief period.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 18, 2003
//:://////////////////////////////////////////////

void main()
{
    int iOnce = GetLocalInt(OBJECT_SELF, "HX_ONE_BEAT");

    if(iOnce == 1)
    {
        DestroyObject(OBJECT_SELF);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "HX_ONE_BEAT", 1);
    }
}
