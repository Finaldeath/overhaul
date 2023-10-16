#include "nw_i0_generic"
void main()
{

    int nUser = GetUserDefinedEventNumber();
    if (nUser==1001)
    {
        int nDay = FALSE;
        if(GetIsDay() || GetIsDawn())
        {
            nDay = TRUE;
//            SpeakString("It is day.");
        }
        else
        {
            nDay=FALSE;
//            SpeakString("It is night.");
        }
        if(GetLocalInt(OBJECT_SELF, "NW_LDAY") != nDay)
        {
            if(nDay == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "NW_LDAY", TRUE);

                if(GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M3Q1MAP_SHIELD"))==TRUE)
                {
                    ClearAllActions();
//                    SpeakString("I am holding a shield.");
                    ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND));
//                    ActionUnequipItem(GetItemPossessedBy(OBJECT_SELF,"M3Q1MAP_TORCH"));
                    ActionEquipItem(GetItemPossessedBy(OBJECT_SELF,"M3Q1MAP_SHIELD"),INVENTORY_SLOT_LEFTHAND);
                    DelayCommand(1.0,WalkWayPoints());
                }
/*                else
                {
                    SpeakString("No shield");
                }*/
            }
            else
            {
                ClearAllActions();
                SetLocalInt(OBJECT_SELF, "NW_LDAY", FALSE);
//                SpeakString("I am holding a torch.");
                ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND));
                ActionEquipItem(GetItemPossessedBy(OBJECT_SELF,"M3Q1MAP_TORCH"),INVENTORY_SLOT_LEFTHAND);
//                WalkWayPoints();
            }
        }
    }
}
