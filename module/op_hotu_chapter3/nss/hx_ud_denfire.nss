//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_denfire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will do fire damage to anyone crossing,
     that isn't flying over.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_appear"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        int iFire = GetLocalInt(GetFirstPC(), "HX_DENFIRE_ON");
    }
}
