// Dahana init conv with player

#include "x2c2_inc_plot"

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetLocalInt(GetModule(), "q4_power_source_taken") == 1 ||
            GetLocalInt(GetModule(),"Aghaaz")==99 ||
            GetLocalInt(GetModule(),"Ferron")==99 )
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

            object oDahana = GetObjectByTag("q4a_Dahanna");
            object oWP = GetWaypointByTag("q4a_Dahanna_wp_wait");
            AssignCommand(oDahana, JumpToObject(oWP));
            DelayCommand(3.0, AssignCommand(oDahana, Talk(oPC)));


        }
}
