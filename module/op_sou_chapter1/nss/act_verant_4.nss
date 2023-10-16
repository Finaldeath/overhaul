//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC takes another evil hit, and Haniah doesn't like PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 19, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    AutoAlignE(DC_EASY, GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"HANIAHLOVE",GetLocalInt(GetPCSpeaker(),"HANIAHLOVE")-40);
}
