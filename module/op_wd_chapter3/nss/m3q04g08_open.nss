// * door opened, Wogar escape global is set
void main()
{
    SetLocalInt(GetModule(),"NW_G_M3Q04TALKWOGAR",1);
    object oOpener = GetLastUsedBy();
    AssignCommand(GetNearestObjectByTag("M3Q04G08WOGAEGB"), ActionStartConversation(oOpener));
}
