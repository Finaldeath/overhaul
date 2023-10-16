// advance Kaidala's story global

void main()
{
    int nStory = GetLocalInt(OBJECT_SELF, "OS_KAI_STORY");
    SetLocalInt(OBJECT_SELF, "OS_KAI_STORY", (nStory + 1));
}
