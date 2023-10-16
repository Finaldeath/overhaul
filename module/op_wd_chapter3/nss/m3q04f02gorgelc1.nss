// * Gorgotha Dragon Reward
void main()
{
    SetLocalObject(OBJECT_SELF, "M3Q04CKLAUTHSLAY", GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "NW_L_M3Q04PLOTKLAUTHDEAD",1)  ;

//    CreateItemOnObject("NW_ASHMTO003", GetPCSpeaker());
    CreateItemOnObject("NW_IT_MBELT003", GetPCSpeaker());
}
