//::///////////////////////////////////////////////
//:: Name con_q2c2_grchain
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
       Set a local string to track which chain is
       being attempted to put into place...
       gre - for green
       red - for red
       yel - for yellow
       pur - for purple
       These are the last three letters of the chain's tag
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 6/02
//:://////////////////////////////////////////////


void main()
{
    SetLocalString(GetModule(),"szAttachChain", "red");
}
