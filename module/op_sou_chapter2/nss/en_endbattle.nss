//::///////////////////////////////////////////////
//:: End Battle (Area OnEnter)
//:: En_EndBattle.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launch the Mythallar rotation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();
    int iDoOnce = GetLocalInt(OBJECT_SELF, "iDoOnce");

    if (GetIsPC(oEnterer) == TRUE && iDoOnce == FALSE)
    {
/*DEBUG*///SendMessageToPC(oEnterer, "Area OnEnter fired");
        object oMythallar_01 = GetObjectByTag("Mythallar_01");
        SignalEvent(oMythallar_01, EventUserDefined(5010));
        SetLocalInt(OBJECT_SELF, "iDoOnce", TRUE);
        //Autosave
        DoSinglePlayerAutoSave();
    }

}
