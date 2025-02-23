#namespace TFLV::Menu;

class ::PlayerLevelUpMenu : ::GenericLevelUpMenu {
  override void Init(Menu parent, OptionMenuDescriptor desc) {
    super.InitDynamic(parent, desc);
    TooltipGeometry(0.5, 1.0, 0.75, 1.0, 0.5);
    TooltipAppearance("", "", "tfttbg");

    let stats = TFLV::EventHandler.GetConsolePlayerStats();
    let giver = TFLV::PlayerUpgradeGiver(stats.currentEffectGiver);

    PushText("", Font.CR_GOLD);
    PushText("$TFLV_MENU_PLAYER_LEVELUP", Font.CR_GOLD);

    mDesc.mSelectedItem = -1;
    for (uint i = 0; i < giver.candidates.size(); ++i) {
      PushUpgrade(giver.stats.upgrades, giver.candidates[i], i);
    }

    PushText("", Font.CR_LIGHTBLUE);
    PushText("$TFLV_MENU_CURRENT_UPGRADES", Font.CR_LIGHTBLUE);
    giver.stats.upgrades.DumpToMenu(self);
    return;
  }
}
