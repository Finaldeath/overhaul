//::///////////////////////////////////////////////
//:: Name Religion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This sets what the PC has told Dynschall about his/her
     religion. Other followers of the same god might
     recognize or like/dislike the PC because of
     the proclaimed belief.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetFirstPC(),"os_pcbelieves",60);
    SetCustomToken(6004,"Rictos");
}
