//::///////////////////////////////////////////////
//:: Opened
//:: M2Q5ALERTELMIN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Elminster is alerted to intruders when the
    door to his room is opened.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 16, 2002
//:://////////////////////////////////////////////

void main()
{
    SignalEvent(GetObjectByTag("M2Q05CELMINSTER"),EventUserDefined(502));
}
