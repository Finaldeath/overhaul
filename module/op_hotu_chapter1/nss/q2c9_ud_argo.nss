//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: q2c9_ud_argo
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Argo's On User Defined -
    On Perception of a PC he will speak his one liner
    On Heartbeat - if no PCs are present and he's not in
    combat - he will randomly flick an antimagic switch.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 14/02
//:://////////////////////////////////////////////
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    //On Heartbeat
    if (nEvent = 1001)
    {
        if (GetAILevel() == AI_LEVEL_VERY_LOW)
            return;
        if (GetIsInCombat() == FALSE)
        {   //if not in combat, Argo will pull a random antimagic lever once / 4 rounds
            if (GetLocalInt(OBJECT_SELF, "nBusy") == 1)
                return;
            //set self busy for 4 rounds
            SetLocalInt(OBJECT_SELF, "nBusy", 1);
            ClearAllActions();

            int nLever = Random(3) + 1;
            //Use the chosen lever
            ActionInteractObject(GetObjectByTag("q2c_lever"+ IntToString(nLever)));

            //unbusy oneself
            DelayCommand(24.0, SetLocalInt(OBJECT_SELF, "nBusy", 0));
        }
    }
    //On Perception
    if (nEvent = 1002)
    {
        if (GetLocalInt(OBJECT_SELF, "nSpeakOnce") == 1)
            return;
        if(GetIsPC(GetLastPerceived()))
        {
            if (GetLastPerceptionSeen() == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "nSpeakOnce", 1);
                SpeakOneLinerConversation();
            }
        }
    }

}
