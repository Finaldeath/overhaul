//::///////////////////////////////////////////////
//:: Damas takes money
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Damas takes the gold and gives the plague
    cure.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

void main()
{

    int nGoldOffered = GetLocalInt(OBJECT_SELF,"NW_L_GOLDOFFERED");
//    SpeakString(IntToString(nGoldOffered));
    TakeGold(nGoldOffered, GetPCSpeaker());
    CreateItemOnObject(M3Q2A11_PLAGUE_CURE,GetPCSpeaker());
    TakePlagueBlankets(GetPCSpeaker()); // destroys them so player cannot reenter the conversation.
    SetLocalInt(GetPCSpeaker(),"Cure",99);

}
