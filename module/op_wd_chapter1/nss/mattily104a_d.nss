#include "M1_Plot"
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 500:
        {
            FleeArea("WP_M1Q5AldoEscape");
        }
        break;
        case 525:
        {
            object oAldo = GetLocalObject(GetModule(),"NW_G_oAldo");
            if(GetLocalInt(GetModule(),"NW_G_PlotAldo") < 20)
            {
                ClearAllActions();
                if(IsInConversation(OBJECT_SELF) == FALSE &&
                   IsInConversation(oAldo) == FALSE &&
                   GetIsInCombat() == FALSE)
                {
                    ActionStartConversation(OBJECT_SELF);
                }
                DelayCommand(18.0f,SignalEvent(OBJECT_SELF,EventUserDefined(525)));
            }
        }
        break;
    }
}
