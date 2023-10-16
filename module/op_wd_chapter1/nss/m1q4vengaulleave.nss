#include "M1_Plot"
void main()
{
    object oTarget = GetPCSpeaker();
    if(GetLocalInt(OBJECT_SELF,"NW_L_Flee"))
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q4DCockInBox",TRUE);
        object oWP = GetWaypointByTag("WP_M1Q4D_M1Q4A");
        //opens container with the cockatrice
        SetLocked(GetNearestObjectByTag("M1Q4CockBox"),FALSE);
        // vengaul flees to the exit
        FleeArea("WP_M1Q4D_M1Q4A");
        if(GetLocalInt(OBJECT_SELF,"NW_L_Angry"))//guards attack
        {
            AdjustReputation(oTarget,OBJECT_SELF,-100);
            ActionSpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
        }
        else//Guards flee
        {
            int nNth = 1;
            object oGuard = GetNearestObjectByTag("m1Q04DGuard",OBJECT_SELF,nNth);
            while(GetIsObjectValid(oGuard))
            {
                AssignCommand(oGuard,FleeArea("WP_M1Q4D_M1Q4A",TRUE,oGuard));
                nNth++;
                oGuard = GetNearestObjectByTag("m1Q04DGuard",OBJECT_SELF,nNth);
            }
        }
     }
     else
     {
        ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + GetTag(OBJECT_SELF)));
     }
}
