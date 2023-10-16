void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
     case 300:
     {
     if(GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 30)
        {
            ClearAllActions();
            SpeakOneLinerConversation();
            DelayCommand(5.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",25));
        }
     else if(GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 25)
        {
            ClearAllActions();
            SpeakOneLinerConversation();
            DelayCommand(5.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",20));
        }
     else if(GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 20)
        {
            ClearAllActions();
            SpeakOneLinerConversation();
            DelayCommand(5.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",15));
        }
     else if(GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 15)
        {
            ClearAllActions();
            SpeakOneLinerConversation();
            DelayCommand(5.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",10));
        }
     else if(GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 10)
        {
            ClearAllActions();
            SpeakOneLinerConversation();
            DelayCommand(5.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",5));
        }
     else if(GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 5)
        {
            ClearAllActions();
            SpeakOneLinerConversation();
            DelayCommand(5.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",0));
            //object oPC=GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            object oWay = GetNearestObjectByTag("WP_M3Q3C_FIRE");
            DelayCommand(5.0,ActionCastSpellAtObject(SPELL_FIREBALL, oWay, METAMAGIC_ANY, TRUE));
            //DelayCommand(5.0,SpeakString("*Fireball*"));
            DelayCommand(9.0,SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",30));
            DelayCommand(10.0,SignalEvent(OBJECT_SELF,EventUserDefined(300)));
        }
     else
        {
            SpeakString("Error");
        }
     }
     break;
     }
}
