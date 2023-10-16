#include "NW_I0_Generic"
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oPlayer = GetLocalObject(OBJECT_SELF,"NW_L_M1Q5DPlayer");
    switch (nEvent)
    {
        case 450:
        {
            object oSelf = OBJECT_SELF;
            SetFacingPoint(GetPosition(oPlayer));
            //SpeakOneLinerConversation();
            DelayCommand(1.0,ActionStartConversation(oSelf));
        }
        break;
        case 490:
        {
           //SpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT);
           ClearAllActions();
           DelayCommand(0.1,DetermineCombatRound(oPlayer));
           int nNth = 1;
           object oGuard = GetNearestObjectByTag("m1Q04CThug02",OBJECT_SELF,nNth);
           while(GetIsObjectValid(oGuard))
           {
                AssignCommand(oGuard,ClearAllActions());
                AssignCommand(oGuard,ActionDoCommand(DetermineCombatRound(oPlayer)));
                nNth++;
                oGuard = GetNearestObjectByTag("m1Q04CThug02",OBJECT_SELF,nNth);
           }
        }
        break;
        case 1003:
        {
            if(Random(3) == 0)
            {
                AssignCommand(GetNearestObjectByTag("m1Q04CVengaul"),SpeakOneLinerConversation("m1q4f22battle"));
            }
        }
        break;
        case 1007:
        {
            object oDoor = GetNearestObjectByTag("M1Q4CallikDoor");
            SetLocked(oDoor,FALSE);
            AssignCommand(oDoor,ActionOpenDoor(oDoor));
            SetPlotFlag(GetNearestObjectByTag("m1Q04CVengaul"),FALSE);
            SetPlotFlag(GetNearestObjectByTag("m1Q04DGuard"),FALSE);
            SetPlotFlag(GetNearestObjectByTag("m1Q04DGuard",OBJECT_SELF,2),FALSE);
        }
        break;

    }
}
