# テストカバレッジの計算方法と闇

## コード網羅率の例
def can_access?(age)
  if age < 18
    false
  else
    true
  end
end

describe "can_access?" do
  context "年齢が18歳未満の場合" do
    it "falseが返ること" do
      expect(can_access?(15)).to eq(false)
    end
  end
end

6 % 7 = 85%

def can_access?(age)
  age < 18 ? false : true
end

describe "can_access?" do
  context "年齢が18歳未満の場合" do
    it "falseが返ること" do
      expect(can_access?(15)).to eq(false)
    end
  end
end

3 % 3 = 100% 
→ テストの質は変わってないのにカバレッジが上がる


## 分岐網羅率の例
def can_access?(age)
  age < 18 ? false : true
end

describe "can_access?" do
  context "年齢が18歳未満の場合" do
    it "falseが返ること" do
      expect(can_access?(15)).to eq(false)
    end
  end
end

=> 1 / 2 = 50%

## 確認不在のテスト
def can_access?(age)
  age < 18 ? false : true
end

describe "can_access?" do
  it "test" do
    can_access?(15)
  end
end

→ 100%