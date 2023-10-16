void main()
{
string sGong = GetTag(OBJECT_SELF);
string sGongNum = GetStringRight(sGong,1);
effect  eVisBad =  EffectVisualEffect(VFX_IMP_CHARM);
effect eVisGood =  EffectVisualEffect(VFX_IMP_HOLY_AID);

int nOrder = GetLocalInt(GetModule(),"M3Q3_GongOrder");
string sTemp = "";
//SpeakString("*gong*" + sGongNum);
switch (StringToInt(sGongNum))
{

    case 1:sTemp = "M3Q3BCatSound";  break;
    case 2:sTemp = "M3Q3BDogSound";  break;
    case 3:sTemp = "M3Q3BBearSound";break;
    case 4:sTemp = "M3Q3BDragonSound"; break;
}
    SoundObjectPlay(GetNearestObjectByTag(sTemp));
    ActionStartConversation(OBJECT_SELF);

if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 1 && GetLocalInt(GetModule(),"M3Q3GongFirst") == StringToInt(sGongNum))
    {
//        SpeakString("Correct");
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisGood, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",nOrder+1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 1 && GetLocalInt(GetModule(),"M3Q3GongFirst") != StringToInt(sGongNum))
    {
        ActionSpeakStringByStrRef(58368);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisBad, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 2 && GetLocalInt(GetModule(),"M3Q3GongSecond") == StringToInt(sGongNum))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisGood, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",nOrder+1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 2 && GetLocalInt(GetModule(),"M3Q3GongSecond") != StringToInt(sGongNum))
    {
        ActionSpeakStringByStrRef(58368);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisBad, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 3 && GetLocalInt(GetModule(),"M3Q3GongThird") == StringToInt(sGongNum))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisGood, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",nOrder+1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 3 && GetLocalInt(GetModule(),"M3Q3GongThird") != StringToInt(sGongNum))
    {
        ActionSpeakStringByStrRef(58368);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisBad, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 4 && GetLocalInt(GetModule(),"M3Q3GongFourth") == StringToInt(sGongNum))
    {
//        SpeakString("success");
        ActionSpeakStringByStrRef(58367);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisGood, OBJECT_SELF);
        object oDoor = GetNearestObjectByTag("M3Q3BGlobeDoor");         //M3Q3BGlobeDoor
        if (GetIsObjectValid(oDoor) == TRUE)
        {
            SetLocked(oDoor, FALSE);
            AssignCommand(oDoor, ActionOpenDoor(oDoor));
            ActionSpeakStringByStrRef(63546);
        }
        SetLocalInt(GetModule(),"M3Q3_GongOrder",nOrder+1);
    }
else if(GetLocalInt(GetModule(),"M3Q3_GongOrder") == 4 && GetLocalInt(GetModule(),"M3Q3GongFourth") != StringToInt(sGongNum) )
    {
//        SpeakString("failure");
        ActionSpeakStringByStrRef(58368);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisBad, OBJECT_SELF);
        SetLocalInt(GetModule(),"M3Q3_GongOrder",1);
    }

}
