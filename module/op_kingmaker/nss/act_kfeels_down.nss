//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This lowers Kaidala's feelings for the PC by
     5 points. It generally happens during direct
     conversation, but can also happen, depending
     on how the PC treats NPC's the nymph likes
     (ie. Hermit).
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 11, 2003
//:://////////////////////////////////////////////
void main()
{
    int nKAI_FEELS = GetLocalInt(GetFirstPC(),"KAI_FEELS_PC");
    nKAI_FEELS = nKAI_FEELS - 5;
    SetLocalInt(GetFirstPC(),"KAI_FEELS_PC", nKAI_FEELS);
}
